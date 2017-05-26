## Cheatsheet Generator

`rcheatsheet` simplifies the process of creating a cheatsheet for R packages by using Google Drive Excel Sheets. 
  
### Install rcheatsheet

You need to install [`googlesheets`](https://github.com/jennybc/googlesheets) in addition to `rcheatsheet`.

```r
install.packages('googlesheets')
devtools::install_github("ramnathv/rcheatsheet")
```

### How to Use

__Step 1: Create Google Sheet__

__Step 2: Add cheatsheet data following the template__

![example](http://i.imgur.com/xJ780b5.gif)


2. Follow the template of labelling worksheets
3. Create cheatsheet using function `make_cheatsheet`

```r
library(rcheatsheet)
library(magrittr)

# Download Google Sheet to Excel
library(googlesheets)
fpath <- 'cheatsheet.xlsx'
sheet_data <- gs_title('cheatsheet data') 
gs_download(sheet_data, to = fpath, overwrite = TRUE)

# Create cheatsheet
x = 1:5
l = list(x = 1:5, y = c('a', 'b'))
df = data.frame(x = 1:3, y = c('a', 'b', 'c'))
fpath %>%
  read_all_sheets %>%
  make_cheatsheet
```



[Slide Deck](https://gitpitch.com/ramnathv/rcheatsheet/master?grs=github&t=moon)

  
