library(data.table)
library(creditmodel)

# data train
data_train <- fread("E:\\Data Science\\R\\it box\\data\\TrSet.csv", 
                    header = TRUE,
                    colClasses = list(
                      numeric = c('EOP_BAL_CS', 'MTH_AVG_BAL_CS', 'MTH6_AVG_BAL_CS',
                                  'DELTA_FUNDING_BALANCE', 'MTH_AVG_BAL_IDR',
                                  'MTH6_AVG_BAL_IDR', 'DELTA_FUNDING_BALANCE_TD', 
                                  'AVG_CREDIT_3MTH', 'DELTA_CREDIT_MUTATION',
                                  'DELTA_DEBIT_MUTATION', 'AVG_DEBIT_3MTH'),
                      character = c('CUST_NO'),
                      factor = c('VTG', 'AGETIER', 'EDUCATION_DESC', 'GENDER',
                                 'CUST_SEGMENT_AVG', 'DELTA_CUST_SEG', 'L_COLL', 'BAD_TAG', 
                                 'SUM_CREDIT_LESS_3MIL', 'SUM_CREDIT_ZERO')
                    ))

data_train <- as.data.frame(data_train)

# data test
data_test <- fread("E:\\Data Science\\R\\it box\\data\\tsSet.csv", 
                   header = TRUE,
                   colClasses = list(
                     numeric = c('EOP_BAL_CS', 'MTH_AVG_BAL_CS', 'MTH6_AVG_BAL_CS',
                                 'DELTA_FUNDING_BALANCE', 'MTH_AVG_BAL_IDR',
                                 'MTH6_AVG_BAL_IDR', 'DELTA_FUNDING_BALANCE_TD', 
                                 'AVG_CREDIT_3MTH', 'DELTA_CREDIT_MUTATION',
                                 'DELTA_DEBIT_MUTATION', 'AVG_DEBIT_3MTH'),
                     character = c('CUST_NO'),
                     factor = c('VTG', 'AGETIER', 'EDUCATION_DESC', 'GENDER',
                                'CUST_SEGMENT_AVG', 'DELTA_CUST_SEG', 'L_COLL', 'BAD_TAG', 
                                'SUM_CREDIT_LESS_3MIL', 'SUM_CREDIT_ZERO')
                   ))

data_test <- as.data.frame(data_test)


# find PSI between 2 variable in different table
# commonly PSI used to find out our data distribution between old data ex : data in 2010
# and data in 2020, but in this case we can use train and test data
# this can help us to find out which feature is good to used or not
get_psi(dat = data_train, dat_test = data_test, x='BAD_TAG',
        occur_time = 'EOP_BAL_CS' , bins_no = TRUE)













