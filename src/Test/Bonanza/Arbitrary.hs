{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections #-}

-- This file is copied and minified version of
-- https://github.com/wireapp/wire-server/blob/d238b11595557e6d2ca356229ed507f522bab06c/tools/bonanza/test/unit/Test/Bonanza/Arbitrary.hs
--
-- This file is part of the Wire Server implementation.
--
-- Copyright (C) 2020 Wire Swiss GmbH <opensource@wire.com>
--
-- This program is free software: you can redistribute it and/or modify it under
-- the terms of the GNU Affero General Public License as published by the Free
-- Software Foundation, either version 3 of the License, or (at your option) any
-- later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
-- details.
--
-- You should have received a copy of the GNU Affero General Public License along
-- with this program. If not, see <https://www.gnu.org/licenses/>.

module Test.Bonanza.Arbitrary where

import Test.QuickCheck (Gen)

genFields :: Gen [(String, Int)]
genFields =
  mapM
    (\(f, g) -> (f,) <$> g)
    [ ("status", genIntField),
      ("body_bytes_sent", genIntField),
      ("http_referer", genIntField),
      ("http_user_agent", genIntField),
      ("http_x_forwarded_for", genIntField),
      ("separator", genIntField),
      ("connection", genIntField),
      ("request_time", genIntField),
      ("upstream_response_time", genIntField),
      ("upstream_cache_status", genIntField),
      ("user", genIntField),
      ("zconn", genIntField),
      ("request", genIntField),
      ("proxy_protocol_addr", genIntField)
    ]

genIntField :: Gen Int
genIntField = pure 0
