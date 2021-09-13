# absmapsdata 1.3.0, 2021-09-13
- Adds 2021 ASGS standard data (SA1-4, GCC, State and Australia).
- Fixes naming convention error in `sa12011`, `sa22011`, `sa12016`, `sa22016` objects where `sa1_code_201X` and `sa2_code_201X` was *incorrectly* named `saX_main_201X`. This was correct in the data documentation but not the actual variable names. This may cause some issues with backwards-compatibility, for which I am sorry.

# absmapsdata 1.2.4, 2021-08-25
- Add Employment Regions. Thanks @mattcowgill for the suggestion.
- Note that this is the first instance of a non-ABS government structure in the package.

# absmapsdata 1.2.3, 2021-06-03
- Set all `sf` objects to CS `4326`. Thanks @ellisp and @daviddiviny for the suggestion.
- Adds some tests ffs.

# absmapsdata 1.2.2, 2021-06-02
- Add Significant Urban Areas, Urban Centres and Localities, Section of State. Thanks to @baslat
- Add Tourism Regions. Thanks to @charlescoverdale.


# absmapsdata 1.2.1, 2019-11-04
- Added more correspondences from 2016 population-weighted file. Thanks to @gdickens for flagging that I'd missed some (many). 

# absmapsdata 1.2, 2019-09-19
- Added 2011 and 2016 destination zones. Thanks to @gabyd for suggesting this.

# absmapsdata 1.1, 2019-08-06
- Requires R >= 3.5.
- Correct `cent_lat` and `cent_long` variables in `sf` objects. Thanks to @jamesha95 for noticing this. 
