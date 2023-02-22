# Group-5

### Jason Smith, Michael Zhou, Tim Brown
### UC Davis Data Analytics Bootcamp

## Tools Used
- Data Gathering:
- Machine Learning:
- Visualizations:
- Amcharts Javascript Chart & Map Repository - https://www.amcharts.com/
- CSV to Javascript array converter: https://www.convertsimple.com/convert-csv-to-javascript-array/
- Tableau Public

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
* Gender: Using the picture provided by the Congressional website the Gender was identified using the avaiable image. Additionally, a search was conducted to determine if any of members of Congress identified outside of the Gender Binary of Male-Female. We did not find any record of this, and thus Gender is presented in our project as Male/Female, based on how the Congresspeople express their identities in public and on Twitter.  </br>
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


## Machine Learning
We decided on a supervized machine learning model with logistic regression. Rather than utilizing train_test_split to divide our data, we decided to iterate the model through the congressional sessions, starting from the congressional session in which Twitter was first created and ending on the current session. As the model was iterated, the session at the time was treated as the testing data, with all prior sessions being combined into the training data for the model. In order to do this, the data had to be cleaned further after being imported into the model. The some of the examined features, gender and party affiliation, needed to be converted into numerical values that could be inputted into the model. 
## Visualizations
For our Visualizations, we wanted to demonstrate the changes in Twitter usage over time, by creating dashboards that demonstrated the demographic breakdown for each Congress Session. Within these dashboards would be displayed charts to visualize the number of Twitter Adoptees per session, broken down by Party, State, and Gender, as well as total Twitter usage within that congress session (including Twitter accounts created before that specific session) broken down by party and gender. 

Our initial goal was to do this with Javascript, specifically using the amcharts library to generate visualizations to correspond with a Congressional District Map, which we found from the amcharts library. However, using Javascript for this purpose entailed several document transformations, a complicated object structure, and a lack of organizational functionality that was necessary to create the sorts of visuals we wanted to.

As a result, we decided partway through the project to instead utilize Tableau. After a basic trial run with our data sources, Tableau proved to be much more straightforward for the relatively simple analyses we were attempting. Due to our ever deepening understanding of our data, Tableau also allowed us to react to any realizations regarding our data in real time. Since the charts we created are relatively simple and do not require complex functionality or calculations, we deemed Tableau to be the better technology for our purposes. Our Dashboard can be seen below:


![Screen Shot 2023-02-21 at 3 43 48 PM](https://user-images.githubusercontent.com/112847821/220484046-023941dd-f5f7-4abe-ab15-e52661d7c6eb.png)


We created 4 charts for our Dashboard, to be featured for each Congressional Session. There are two pie charts, one to show the proportions of each party's Twitter adoption for that session, and one to show how many Congresspeople have or do not have Twitter accounts overall within that session. The pie chart to measure party adoption allows us to determine how much party contributed to a congressperson's decision to adopt Twitter, or how many individuals within a congress session are new to congress, and thus creating new Twitter accounts. The chart to show overall Twitter usage throughout congress shows us both the Twitter accounts that were created in that session, as well as any congresspeople that had twitter during that session, but started their congressional twitter accounts earlier. 

Additionally, there are two bar charts- one shows the overall Twitter usage in the congress session, split by party, and by gender within that party, and another that shows the number of twitter adoptees per session per state, also broken up by gender. These charts allow us to examine party and state demographics, and how they contribute to Twitter adoption.

It is important to note that there are limitations to these visualizations. Because our data set is so large and requires a number of conditionals for each chart and measurement 'bin', so to speak, some of our measurements do not always line up as expected. Most notably, the pie chart of total Twitter usage does not always add up to the total number of members of congress within the House of Representatives- 435. This is largely in part to how we cleaned the data- our sources and analysis did not count a member of congress as a member unless they completed an entire session- if they left partway through, or joined partway through, they would not be counted. We noticed that the typical reasons for a change partway through a congressional session that would cause this included death, sickness, other hardships, and scandal that forced a representative to resign. 

Further, the pie chart and bar chart of total twitter usage within a session do not always show the same number of individuals as having a twitter. This is likely due to the slightly different bins that were made for each chart- one (the party/gender chart) reviews just the set of data of those we manually labeled as a member of a congress session- the other (the pie chart) examines all values in a field called 'NT' that prints 'Has Twitter' or 'No Twitter'. The latter is less discerning in what it accepts into its bin, as its source is less edited than what we used for the party/gender chart. Therefore, it may accept representatives from US territories, which we did not include in some portions of our analysis, or it may count twice for one district if it has a switch in representative partway through, as discussed previously.

While these limitations are noticeable, we ultimately chose to allow them to stay in the visualizatons for a few reasons, primarily being time and necessity. The time needed to correct these imbalances would have been significant, as it would have required a secondary manual review of all the data. As these charts are not being used for calculations and rather to impart and understanding of rates of twitter adoption and demographic splits, these slight numerical deviations do not greatly affect the message that the visualizations provide us. As a result, since the charts still provide useful information despite these slight deviations, it is not necessary to their function to spend this time to alter the data sets for these visualizations. These deviations also would not affect the Machine Learning portions of our project, as they involve bins and columns created specifically for the visualizations. 


Had we had more time, it would have been ideal to also create a Javascript map using the amcharts library to provide more specific visualizations regarding actual state and geographical distributions, which would have made for interesting data to analyze cultural attitudes towards Twitter in the early years of its adoption. 

## Results, Conclusions

Based on the results of our Machine Learning model, we determined the following regarding whether or not the data we have was enough to create a useful model to predict social media adoption:

The visualizations demonstrate that after an initially high proportion of Congress people using twitter in the first congress session after which it was created (110th Session, as Twitter was created in 2006 during the 109th), there is a drop in the 111th, and then steady increase over the next two sessions (112 and 113) until it reaches the concentration it does in the 114th session, which started in 2015. So from 2006 to 2015, in about 9 years, Twitter became massively used within Congress, and that concentration has remained relatively stable since then. There are still, and appear to always be, some holdouts who will not use Twitter in Congress, although they are a definite minority. This growth can be seen below:

![Screen Shot 2023-02-21 at 3 44 37 PM](https://user-images.githubusercontent.com/112847821/220484153-651d07c7-b075-41f2-8276-6a380275a401.png)

![Screen Shot 2023-02-21 at 3 44 59 PM](https://user-images.githubusercontent.com/112847821/220484206-4e7565d9-e0e3-4bb5-9774-5179acf7498d.png)

![Screen Shot 2023-02-21 at 3 45 26 PM](https://user-images.githubusercontent.com/112847821/220484249-20e9c711-22e8-4f1a-abd7-b61630450959.png)

![Screen Shot 2023-02-21 at 3 45 47 PM](https://user-images.githubusercontent.com/112847821/220484298-c4ce784f-0196-4d03-9e50-4eb64d852c4e.png)

![Screen Shot 2023-02-21 at 3 46 05 PM](https://user-images.githubusercontent.com/112847821/220484347-bf7092d3-1713-430e-9300-b3bedee91323.png)


The demographic charts show that twitter usage and adoption within a party largely has to do with the party demographics itself, and match up with what we can learn from demographics within the Democratic or Republican parties themselves. Twitter adoption rates seem to primarily be affected by which party received more new members of congress, especially in later sessions, as this proportion swings back and forth. Additionally, state size seems to be an accurate predictor of comparative number of congresspeople who would join in a given state in a given session. 

The most valuable information from the visualizations for the purpose of our project is the time it took for Twitter to become ubiquitous, and that it had an initially higher amount of people with it in Congress 110, then a drop, then a steady increase in usage. 
