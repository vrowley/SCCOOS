library(ncdf4)
library(googledrive)
library(xlsx)

from gdata.spreadsheet.service import SpreadsheetsService

key = '1fN99tA0qgKth-jEB6RkYoQuOQjhudbC6gJ8aT_8rRqk'

client = SpreadsheetsService()
feed = client.GetWorksheetsFeed(key, visibility='public', projection='basic')

for sheet in feed.entry:
  print sheet.title.text
