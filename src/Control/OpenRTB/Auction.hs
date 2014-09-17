
module Control.OpenRTB.Auction where

{-
whats our query vocab?

maybe ands a ords

-}

data BQuery = AND [BQuery] | OR [BQuery]
    | Simple AtomicQuery

data AtomicQuery =  HasIPPrefix | DeviceInfo | GeoTimeZone

data Query =  DaQuery {has :: BQuery,
                        butExcept:: RejectionRules }



{-

-}
{-
compile current universe o



-}

data EvaluationFunction =  LogisticFeature (Vector (Int,Double)) Budget |