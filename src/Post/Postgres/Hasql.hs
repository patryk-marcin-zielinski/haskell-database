{-# LANGUAGE OverloadedStrings #-}
module Post.Postgres.Hasql where

import Hasql
import Hasql.Postgres
import Hasql.Connection
import Hasql.Statement
import Hasql.Session
import Hasql.Decoders
import Hasql.Encoders



mySettings :: Settings
mySettings = settings "localhost" 5432 "postgres" "" "postgres"



main :: IO ()
main = do
  Right connection <- Connection.acquire connectionSettings
  result <- Session.run (sumAndDivModSession 3 8 3) connection
  print result



selectAllPosts