![LOGO](http://auunconf.ropensci.org/images/ropensci-logo-big.png)

#### Cheatsheet Generator from R
<br>
<span style="color:gray">rOpenSci Unconference 2017</span>
<br>
<span style="color:steelblue">Diana Ly & Ramnath Vaidyanathan</span>
<br>

---

### Step 1: Create Google Sheet with Cheatsheet Data

![example](http://i.imgur.com/xJ780b5.gif)

---

### Step 2: Create Cheatsheet

```r
# Download Google Sheet to Excel
fpath <- 'cheatsheet.xlsx'
sheet_data <- gs_title('cheatsheet data') 
gs_download(sheet_data, to = fpath, overwrite = TRUE)

# Create cheatsheet
fpath %>%
  read_all_sheets %>%
  make_cheatsheet
```

---

### Step 3: Enjoy your freshly minted cheatsheet.

![cheatsheet](http://i.imgur.com/D9SZUoH.png)

