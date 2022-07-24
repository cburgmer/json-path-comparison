module Main where

import System.Environment
import System.Exit
import Data.JSONPath
import Text.Megaparsec
import qualified Data.Text as T
import qualified Data.ByteString.Lazy.Char8 as LBS
import qualified Data.Aeson as A

main :: IO ()
main = do
  pathStr <- readPathStr
  jsonpath <- parseJSONPath pathStr
  input <- readInput
  LBS.putStrLn $ A.encode $ A.toJSON $ executeJSONPath jsonpath input

readPathStr :: IO String
readPathStr = do
  args <- getArgs
  case args of
    [pathStr] -> return pathStr
    _ -> do
      progName <- getProgName
      putStrLn $ "Usage: " ++ progName ++ " <json-path-query>"
      error "Invalid arguments"

parseJSONPath :: String -> IO [JSONPathElement]
parseJSONPath pathStr =
  case parse (jsonPath eof) "" $ T.pack pathStr of
    Right jsonpath -> return jsonpath
    Left e -> do
      putStrLn $ "Invalid JSONPath: " ++ pathStr ++ "\n Error: " ++ errorBundlePretty e
      exitWith (ExitFailure 2)

readInput :: IO A.Value
readInput = do
  inputStr <- LBS.getContents
  case A.decode inputStr of
    Just val -> return val
    Nothing -> do
      putStrLn "Invalid JSON provided in STDIN"
      error "Invalid Input"
