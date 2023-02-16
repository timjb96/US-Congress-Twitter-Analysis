# Group-5

### Jason Smith, Michael Zhou, Tim Brown
### UC Davis Data Analytics Bootcamp

## Tools Used
- Data Gathering:
- Machine Learning:
- Visualizations:
- Amcharts Javascript Chart & Map Repository - https://www.amcharts.com/
- CSV to Javascript array converter: https://www.convertsimple.com/convert-csv-to-javascript-array/

## Purpose of Study
For our final project, our group will be investigating Twitter usage in Congress. Specifically, we wish to use machine learning to determine whether a model can be generated to accurately predict social media adoption (focusing on Twitter) in Congress over time. We will use data from the first years of Twitter's existence to train a model to predict the increase in usage per candidates in later years. 

Along with the generation of a predictive model that can be used to analyze social media usage changes of other applications besides Twitter, we aim to also create visualizations that demonstrate the different demographics among Congressional Twitter users and how the presence of a twitter account can affect re-election. 

## Sources of Data
List of Congressional Members: www.congress.gov</br>
Specific search used to gather information: [US Congressional Site](https://www.congress.gov/search?pageSize=250&q=%7B%22source%22%3A%22members%22%2C%22congress%22%3A%5B%22118%22%2C%22117%22%2C%22116%22%2C%22112%22%2C%22113%22%2C%22114%22%2C%22115%22%2C%22111%22%2C%22109%22%2C110%5D%7D) </br>
Intial list of twitter handles: [Press Gallery Twitter List](https://pressgallery.house.gov/member-data/members-official-twitter-handles) </br>
Twitter website: www.twitter.com </br>
State Abreviations: [FAA State List](https://www.faa.gov/air_traffic/publications/atpubs/cnt_html/appendix_a.html) </br>
Amcharts State and District ID: [AMCharts](https://www.amcharts.com/docs/v4/)</br>

# How did we clean the data?
Using the data provided by the Congress website only a few columns were provided (Name, URL, State,	District, Party, Terms). For the scope of our research several factors needed to be researched, Date of Birth, Gender, Twitter Handle, Date the Twitter account was created. To find the date of birth for a specific Congress person the data provides a specific website created for each member, using the current Speaker of the House for the 118 Congress (Kevin McCarthy - R CA20th), here is the specific website: [Kevin McCarty](https://www.congress.gov/member/kevin-mccarthy/M001165) </br>
* Date of Birth: At the bottom of the page a section for "read biography" is avaiable to select, using the information provided in the new page the Date of Birth is avaible. This information was manually searched for each row in the dataset. A public list of the information was not readaliy available. 
* Gender: Using the picture provided by the Congressional website the Gender was identified using the avaiable image. An additional search was conducted to identify any members of the LGBT+ community which identify as anything other than their birth gender, at the time of this writing (02/10/2023) none were found. Any errors with distinction of Male / Female were made without any malaous. </br>
Note: Additional Research Source: [Current Congressional List of LGBT Members](https://en.wikipedia.org/wiki/List_of_LGBT_members_of_the_United_States_Congress)</br>
* Twitter Handle: Using the same example for Speaker McCarthy, a personal website is linked to the congressional website. This new website (https://kevinmccarthy.house.gov/contact) has a link to the Twitter homepage. Using the information provided by Twitter, the handle is located under the picture of the indivudual user. </br>
* Date the account was created: Twitter provides a month and year combiniatnon that the account is created. For the purposes of this analysis the "day" was assumed as the 1st of whatever month and year combination was provided. In the example for Speak McCarthy, the date 01/01/2009 was assumed. 

Finding Twitter accounts not linked in the Congressional website: Only a small number of congressional members have their own Contact page, for those represenatives which did not have a page a manual search was done using Twitter.com. Enter in the name of the person being research several results might return. To validate which user was linked to which congressperson several factors were used: 
* Matching picture from the Congressional website vs Twitter user picture (I.E. Hilda Solis, @HildaSolis, https://twitter.com/HildaSolis)
* Validating the summary of the user matched the data provided (I.E. Ed Royce, @EdRRoyce, https://twitter.com/EdRRoyce)
* Archived twitter accounts

# Additional Data wrangling: 
There were additional steps needed to complete the data cleaning process. 
* Update a few users and remove non UTC-8 characters found in the name. 
</br>Cardenas, Tony
</br>Sanchez, Linda T.
</br>Gonzalez-Colon, Jenniffer
* Create UniqueID's for each person. This was created using the first two letters in the last name, the first letter in the first name, adding a "-", then combining the State abrivation along with the district they supported. I.E. McK-CA20 for Kevin McCarthy. </br>
NOTE: An exception was found for when a Father / Son congress members inside the same district in New Jersey. A Jr and Sr were added to the names to keep the records seperated. 
* Add an updated StateDistID column. This column represents a combination of the State ID # used by AMCharts, & the district ID number
* Remove Senate Members: There was a small sample group of electected officals which had a Senate seat but had served as a member of Congress before 2007, these users were removed. 
* Non consecutive Congressional Sessions: Out of the 1134 records in this data set, 21 members had a break between their 1st term and the 2nd term (I.E. Bass, Charles F, 1995-2007, 2011-2013), 2 members had 3 different terms (Shea-Porter, Carol - 2007-2011, 2013-2015, 2017-2019 & Kirkpatrick, Ann - 2009-2011, 2013-2017, 2019-2023)
* Members which served in different districts on different terms: There were a few Members which served at various times in different districts in different sessions. The data provided by the website reflects the "latest" District. </br>
I.E. Hilda L. Solis</br>
California, District 32 108th-111th (2003-2009)</br>
California, District 31 107th (2001-2003)</br>

## How did we clean the data?

## Machine Learning
We decided on a supervized machine learning model with logistic regression
## Visualizations

## Results, Conclusions
