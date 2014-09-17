{-# LANGUAGE OverloadedStrings #-}

module Data.OpenRTB where
import Control.Applicative
import Data.Aeson
import Data.Text as T
import Data.Word
import Data.Int

data BidRequestTopLevel = BRTL {
      _bidID :: (T.Text) -- alwayas <= 40 chars long
      ,_bidAuctionType ::( Maybe Word8 )
      ,_bidTimeOutMax :: (Maybe Word32)
      ,_bidImpressionLIst :: [BidImpressionObject]
      }

data BidImpressionObject = BIMPO {
        _bimpID :: T.Text
        ,_bimpSeat :: () --- stub, dont lookup this field for ow
        ,_bimpHeight :: Int32
        ,_bimpWidth :: Int32
        ,_bimpPosn :: Int32
        ,_bimpIsInterSitch :: Maybe Bool --- encoded as 0,1 values, not always there
    }
    deriving (Eq,Show,Read)


instance FromJSON BidImpressionObject where
  parseJSON (Object kv)= BIMPO <$>
                            kv .: "impid" <*>
                            pure () <*> -- fixme later
                            kv .: "h" <*>
                            kv .: "w" <*>
                            kv .: "pos" <*>
                            ( sanitizeStitial <$> kv .:? "instl")
                where
                  sanitizeStitial:: Maybe Int -> Maybe Bool
                  sanitizeStitial Nothing =  Nothing
                  sanitizeStitial (Just i) | i == 1 = Just True
                                      | i== 0 = Just False
                                      | otherwise = Nothing





