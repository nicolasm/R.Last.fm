# Install RMySQL: run this in a workspace
# install.packages("RMySQL")

library(RMySQL)

con <- dbConnect(MySQL(), group = "lastfm-mysql")

dbListTables(con)

# Play count by month
my.data.frame <- dbReadTable(conn = con,name = 'view_play_count_by_month', title = "Play count by month")
write.csv(my.data.frame, file = "countsByMonth.csv", row.names = F)

# Tops artists
top.artists <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=7 p) parm, view_top_artists_for_last_n_days v;")
write.csv(top.artists, file = "topArtistsForLast7Days.csv", row.names = F)

top.artists <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=30 p) parm, view_top_artists_for_last_n_days v;")
write.csv(top.artists, file = "topArtistsForLast30Days.csv", row.names = F)

top.artists <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=90 p) parm, view_top_artists_for_last_n_days v;")
write.csv(top.artists, file = "topArtistsForLast90Days.csv", row.names = F)

top.artists <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=365 p) parm, view_top_artists_for_last_n_days v;")
write.csv(top.artists, file = "topArtistsForLast365Days.csv", row.names = F)

top.artists <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=null p) parm, view_top_artists_for_last_n_days v;")
write.csv(top.artists, file = "topArtistsForAllTime.csv", row.names = F)

# Tops albums
top.albums <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=7 p) parm, view_top_albums_for_last_n_days v;")
write.csv(top.albums, file = "topAlbumsForLast7Days.csv", row.names = F)

top.albums <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=30 p) parm, view_top_albums_for_last_n_days v;")
write.csv(top.albums, file = "topAlbumsForLast30Days.csv", row.names = F)

top.albums <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=90 p) parm, view_top_albums_for_last_n_days v;")
write.csv(top.albums, file = "topAlbumsForLast90Days.csv", row.names = F)

top.albums <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=365 p) parm, view_top_albums_for_last_n_days v;")
write.csv(top.albums, file = "topAlbumsForLast365Days.csv", row.names = F)

top.albums <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=null p) parm, view_top_albums_for_last_n_days v;")
write.csv(top.albums, file = "topAlbumsForAllTime.csv", row.names = F)

# Tops tracks
top.tracks <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=7 p) parm, view_top_tracks_for_last_n_days v;")
write.csv(top.tracks, file = "topTracksForLast7Days.csv", row.names = F)

top.tracks <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=30 p) parm, view_top_tracks_for_last_n_days v;")
write.csv(top.tracks, file = "topTracksForLast30Days.csv", row.names = F)

top.tracks <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=90 p) parm, view_top_tracks_for_last_n_days v;")
write.csv(top.tracks, file = "topTracksForLast90Days.csv", row.names = F)

top.tracks <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=365 p) parm, view_top_tracks_for_last_n_days v;")
write.csv(top.tracks, file = "topTracksForLast365Days.csv", row.names = F)

top.tracks <- dbGetQuery(conn = con, statement = "select v.* from (select @nb_days:=null p) parm, view_top_tracks_for_last_n_days v;")
write.csv(top.tracks, file = "topTracksForAllTime.csv", row.names = F)
