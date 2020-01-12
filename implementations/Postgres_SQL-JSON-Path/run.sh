#/bin/bash
set -euo pipefail

readonly document="$(cat)"
readonly selector="$1"

if ! pg_ctl status > /dev/null; then
    pg_ctl start > /dev/null

    while 1; do
      if psql -l > /dev/null 2>&1; then
          break
      fi
      sleep 1
    done
fi

psql -tc "SELECT array_to_json(array_agg(r.to_json)) FROM (SELECT to_json(jsonb_path_query('${document}', '${selector}'))) r;"
