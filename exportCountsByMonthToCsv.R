# Install RSQLite: run this in a workspace
# install.packages("RSQLite")

library(DBI)

con <- dbConnect(RSQLite::SQLite(), dbname="lastfm.sqlite")

dbListTables(con)

my.data.frame <- dbGetQuery(con, "select strftime('%Y_%m', date) as month, count(*) as count from tracks group by month order by month")
write.csv(my.data.frame, file = "countsByMonth.csv", row.names = F)