*Death Probabilities for Men and Women across 20th century

*Female; 

Proc Import Out = FemaleDeathProb  

datafile = "/home/u59299973/sasuser.v94/New Folder/DeathProbs_Female.xlsx"  

dbms = xlsx replace; 

getnames = yes; 

run; 


*Male; 

Proc Import out = MaleDeathProb1  

datafile = "/home/u59299973/sasuser.v94/New Folder/DeathProbs_Male.xlsx" 

dbms = xlsx replace; 

getnames = yes; 

run; 

data maledeathprob;
set maledeathprob1;
if year= ' ' then delete;
run;

proc print data=femaledeathprob;
run;
proc print data=maledeathprob;
run; 

**Separating age into age group**; 

****f_infant: 0 yrs old 

	f_child: 1-11 yrs old 

	f_teen: 12-17 yrs old 

	f_adult: 18-64 yrs old; 

data F_agegroup; 

set femaledeathprob; 

f_infant = mean('0'n); 

f_child = mean(of '1'n -'11'n); 

f_teen = mean(of '12'n-'17'n); 

f_adult = mean(of '18'n-'64'n); 

run; 

  

data M_agegroup; 

set maledeathprob; 

m_infant = mean('0'n); 

m_child = mean(of '1'n-'11'n); 

m_teen = mean(of '12'n-'17'n); 

m_adult = mean(of '18'n-'64'n); 

run; 

  

**SCATTERPLOT OF AGE GROUP BY YEAR**; 

symbol1 color = blue I = join; 

symbol2 color = green I = join; 

symbol3 color = orange I = join; 

symbol4 color = purple I = join; 

ods graphics on; 

axis1 label= (angle=90 "Death Probability"); 

proc gplot data = f_agegroup; 

plot f_infant*year = 1 f_child*year = 2 f_teen*year = 3 f_adult*year = 4/overlay legend vaxis=axis1; 

Title "Death Probabilities: Female Age Group by Year"; 

run; 

  

symbol1 color = blue I = join; 

symbol2 color = green I = join; 

symbol3 color = orange I = join; 

symbol4 color = purple I = join; 

axis1 label= (angle=90 "Death Probability"); 

proc gplot data = m_agegroup; 

plot m_infant*year = 1 m_child*year = 2 m_teen*year = 3 m_adult*year = 4/overlay legend vaxis=axis1; 

Title "Death Probabilities: Male Age Group by Year"; 

run; 

ods graphics off; 

  

*Only keep age group data; 


data f_var_only; 

set f_agegroup; 

keep year f_infant f_child f_teen f_adult; 

run; 

proc sort data= f_var_only;
by year;
run;

data m_var_only; 

set m_agegroup; 

keep year m_infant m_child m_teen m_adult; 

run; 

proc sort data= m_var_only;
by year;

run;

data merge_data; 

merge f_var_only m_var_only; 

by year; 

run; 

  

**SEPARATE BY DECADE**; 

*1900s; 

data dec_1900s; 

set merge_data; 

if _N_ <= 10 then decade = '1900s'; 

run; 

  

  

*Take mean of age group by decade - Age group mean death prob in 1900s; 

proc means data=dec_1900s noprint; 

    output out=avg_f_inf_1900s mean(f_infant)=f_inf_1900s; 

    output out=avg_f_chi_1900s mean(f_child)=f_chi_1900s; 

    output out=avg_f_teen_1900s mean(f_teen)=f_teen_1900s; 

    output out=avg_f_adult_1900s mean(f_adult)=f_adult_1900s; 

    output out=avg_m_inf_1900s mean(m_infant)=m_inf_1900s; 

    output out=avg_m_chi_1900s mean(m_child)=m_chi_1900s; 

    output out=avg_m_teen_1900s mean(m_teen)=m_teen_1900s; 

    output out=avg_m_adult_1900s mean(m_adult)=m_adult_1900s; 

run; 

  

*1910s; 

data dec_1910s; 

set merge_data; 

if 11 <= _N_ <= 20; 

decade = '1910s'; 

run; 

  

proc means data=dec_1910s noprint; 

    output out=avg_f_inf_1910s mean(f_infant)=f_inf_1910s; 

    output out=avg_f_chi_1910s mean(f_child)=f_chi_1910s; 

    output out=avg_f_teen_1910s mean(f_teen)=f_teen_1910s; 

    output out=avg_f_adult_1910s mean(f_adult)=f_adult_1910s; 

    output out=avg_m_inf_1910s mean(m_infant)=m_inf_1910s; 

    output out=avg_m_chi_1910s mean(m_child)=m_chi_1910s; 

    output out=avg_m_teen_1910s mean(m_teen)=m_teen_1910s; 

    output out=avg_m_adult_1910s mean(m_adult)=m_adult_1910s; 

run; 

  

*1920s; 

data dec_1920s; 

set merge_data; 

if 21 <= _N_ <= 30; 

decade = '1920s'; 

  

proc means data=dec_1920s noprint; 

    output out=avg_f_inf_1920s mean(f_infant)=f_inf_1920s; 

    output out=avg_f_chi_1920s mean(f_child)=f_chi_1920s; 

    output out=avg_f_teen_1920s mean(f_teen)=f_teen_1920s; 

    output out=avg_f_adult_1920s mean(f_adult)=f_adult_1920s; 

    output out=avg_m_inf_1920s mean(m_infant)=m_inf_1920s; 

    output out=avg_m_chi_1920s mean(m_child)=m_chi_1920s; 

    output out=avg_m_teen_1920s mean(m_teen)=m_teen_1920s; 

    output out=avg_m_adult_1920s mean(m_adult)=m_adult_1920s; 

run; 

  

*1930s; 

data dec_1930s; 

set merge_data; 

if 31 <= _N_ <= 40; 

decade = '1930s'; 

  

proc means data=dec_1930s noprint; 

    output out=avg_f_inf_1930s mean(f_infant)=f_inf_1930s; 

    output out=avg_f_chi_1930s mean(f_child)=f_chi_1930s; 

    output out=avg_f_teen_1930s mean(f_teen)=f_teen_1930s; 

    output out=avg_f_adult_1930s mean(f_adult)=f_adult_1930s; 

    output out=avg_m_inf_1930s mean(m_infant)=m_inf_1930s; 

    output out=avg_m_chi_1930s mean(m_child)=m_chi_1930s; 

    output out=avg_m_teen_1930s mean(m_teen)=m_teen_1930s; 

    output out=avg_m_adult_1930s mean(m_adult)=m_adult_1930s; 

run; 

  

*1940s; 

data dec_1940s; 

set merge_data; 

if 41 <= _N_ <= 50; 

decade = '1940s'; 

  

proc means data=dec_1940s noprint; 

    output out=avg_f_inf_1940s mean(f_infant)=f_inf_1940s; 

    output out=avg_f_chi_1940s mean(f_child)=f_chi_1940s; 

    output out=avg_f_teen_1940s mean(f_teen)=f_teen_1940s; 

    output out=avg_f_adult_1940s mean(f_adult)=f_adult_1940s; 

    output out=avg_m_inf_1940s mean(m_infant)=m_inf_1940s; 

    output out=avg_m_chi_1940s mean(m_child)=m_chi_1940s; 

    output out=avg_m_teen_1940s mean(m_teen)=m_teen_1940s; 

    output out=avg_m_adult_1940s mean(m_adult)=m_adult_1940s; 

run; 

  

*1950s; 

data dec_1950s; 

set merge_data; 

if 51 <= _N_ <= 60; 

decade = '1950s'; 

  

proc means data=dec_1950s noprint; 

    output out=avg_f_inf_1950s mean(f_infant)=f_inf_1950s; 

    output out=avg_f_chi_1950s mean(f_child)=f_chi_1950s; 

    output out=avg_f_teen_1950s mean(f_teen)=f_teen_1950s; 

    output out=avg_f_adult_1950s mean(f_adult)=f_adult_1950s; 

    output out=avg_m_inf_1950s mean(m_infant)=m_inf_1950s; 

    output out=avg_m_chi_1950s mean(m_child)=m_chi_1950s; 

    output out=avg_m_teen_1950s mean(m_teen)=m_teen_1950s; 

    output out=avg_m_adult_1950s mean(m_adult)=m_adult_1950s; 

run; 

  

*1960s; 

data dec_1960s; 

set merge_data; 

if 61 <= _N_ <= 70; 

decade = '1960s'; 

  

proc means data=dec_1960s noprint; 

    output out=avg_f_inf_1960s mean(f_infant)=f_inf_1960s; 

    output out=avg_f_chi_1960s mean(f_child)=f_chi_1960s; 

    output out=avg_f_teen_1960s mean(f_teen)=f_teen_1960s; 

    output out=avg_f_adult_1960s mean(f_adult)=f_adult_1960s; 

    output out=avg_m_inf_1960s mean(m_infant)=m_inf_1960s; 

    output out=avg_m_chi_1960s mean(m_child)=m_chi_1960s; 

    output out=avg_m_teen_1960s mean(m_teen)=m_teen_1960s; 

    output out=avg_m_adult_1960s mean(m_adult)=m_adult_1960s; 

run; 

  

*1970s; 

data dec_1970s; 

set merge_data; 

if 71 <= _N_ <= 80; 

decade = '1970s'; 

  

proc means data=dec_1970s noprint; 

    output out=avg_f_inf_1970s mean(f_infant)=f_inf_1970s; 

    output out=avg_f_chi_1970s mean(f_child)=f_chi_1970s; 

    output out=avg_f_teen_1970s mean(f_teen)=f_teen_1970s; 

    output out=avg_f_adult_1970s mean(f_adult)=f_adult_1970s; 

    output out=avg_m_inf_1970s mean(m_infant)=m_inf_1970s; 

    output out=avg_m_chi_1970s mean(m_child)=m_chi_1970s; 

    output out=avg_m_teen_1970s mean(m_teen)=m_teen_1970s; 

    output out=avg_m_adult_1970s mean(m_adult)=m_adult_1970s; 

run; 

  

  

*1980s; 

data dec_1980s; 

set merge_data; 

if 81 <= _N_ <= 90; 

decade = '1980s'; 

  

proc means data=dec_1980s noprint; 

    output out=avg_f_inf_1980s mean(f_infant)=f_inf_1980s; 

    output out=avg_f_chi_1980s mean(f_child)=f_chi_1980s; 

    output out=avg_f_teen_1980s mean(f_teen)=f_teen_1980s; 

    output out=avg_f_adult_1980s mean(f_adult)=f_adult_1980s; 

    output out=avg_m_inf_1980s mean(m_infant)=m_inf_1980s; 

    output out=avg_m_chi_1980s mean(m_child)=m_chi_1980s; 

    output out=avg_m_teen_1980s mean(m_teen)=m_teen_1980s; 

    output out=avg_m_adult_1980s mean(m_adult)=m_adult_1980s; 

run; 

  

*1990s; 

data dec_1990s; 

set merge_data; 

if 91 <= _N_ <= 100; 

decade = '1990s'; 

  

proc means data=dec_1990s noprint; 

    output out=avg_f_inf_1990s mean(f_infant)=f_inf_1990s; 

    output out=avg_f_chi_1990s mean(f_child)=f_chi_1990s; 

    output out=avg_f_teen_1990s mean(f_teen)=f_teen_1990s; 

    output out=avg_f_adult_1990s mean(f_adult)=f_adult_1990s; 

    output out=avg_m_inf_1990s mean(m_infant)=m_inf_1990s; 

    output out=avg_m_chi_1990s mean(m_child)=m_chi_1990s; 

    output out=avg_m_teen_1990s mean(m_teen)=m_teen_1990s; 

    output out=avg_m_adult_1990s mean(m_adult)=m_adult_1990s; 

run; 

  

*2000s; 

data dec_2000s; 

set merge_data; 

if 101 <= _N_ <= 111; 

decade = '2000s'; 

run; 

  

proc means data=dec_2000s noprint; 

    output out=avg_f_inf_2000s mean(f_infant)=f_inf_2000s; 

    output out=avg_f_chi_2000s mean(f_child)=f_chi_2000s; 

    output out=avg_f_teen_2000s mean(f_teen)=f_teen_2000s; 

    output out=avg_f_adult_2000s mean(f_adult)=f_adult_2000s; 

    output out=avg_m_inf_2000s mean(m_infant)=m_inf_2000s; 

    output out=avg_m_chi_2000s mean(m_child)=m_chi_2000s; 

    output out=avg_m_teen_2000s mean(m_teen)=m_teen_2000s; 

    output out=avg_m_adult_2000s mean(m_adult)=m_adult_2000s; 

run; 

  

*Merge of age group by year with decade; 

data complete_merge; 

merge dec_1900s dec_1910s dec_1920s dec_1930s dec_1940s dec_1950s dec_1960s dec_1970s dec_1980s dec_1990s dec_2000s; 

by year; 


run; 

  

proc print data = complete_merge; 

run; 


*Merged data of average of age groups by decade; 

data dec_merged; 

merge avg_f_inf_1900s avg_f_inf_1910s avg_f_inf_1920s avg_f_inf_1930s avg_f_inf_1940s avg_f_inf_1950s 

avg_f_inf_1960s avg_f_inf_1970s avg_f_inf_1980s avg_f_inf_1990s avg_f_inf_2000s 

avg_f_chi_1900s avg_f_chi_1910s avg_f_chi_1920s avg_f_chi_1930s avg_f_chi_1940s avg_f_chi_1950s 

avg_f_chi_1960s avg_f_chi_1970s avg_f_chi_1980s avg_f_chi_1990s avg_f_chi_2000s 

avg_f_teen_1900s avg_f_teen_1910s avg_f_teen_1920s avg_f_teen_1930s avg_f_teen_1940s avg_f_teen_1950s 

avg_f_teen_1960s avg_f_teen_1970s avg_f_teen_1980s avg_f_teen_1990s avg_f_teen_2000s 

avg_f_adult_1900s avg_f_adult_1910s avg_f_adult_1920s avg_f_adult_1930s avg_f_adult_1940s avg_f_adult_1950s 

avg_f_adult_1960s avg_f_adult_1970s avg_f_adult_1980s avg_f_adult_1990s avg_f_adult_2000s 

avg_m_inf_1900s avg_m_inf_1910s avg_m_inf_1920s avg_m_inf_1930s avg_m_inf_1940s avg_m_inf_1950s 

avg_m_inf_1960s avg_m_inf_1970s avg_m_inf_1980s avg_m_inf_1990s avg_m_inf_2000s 

avg_m_chi_1900s avg_m_chi_1910s avg_m_chi_1920s avg_m_chi_1930s avg_m_chi_1940s avg_m_chi_1950s 

avg_m_chi_1960s avg_m_chi_1970s avg_m_chi_1980s avg_m_chi_1990s avg_m_chi_2000s 

avg_m_teen_1900s avg_m_teen_1910s avg_m_teen_1920s avg_m_teen_1930s avg_m_teen_1940s avg_m_teen_1950s 

avg_m_teen_1960s avg_m_teen_1970s avg_m_teen_1980s avg_m_teen_1990s avg_m_teen_2000s 

avg_m_adult_1900s avg_m_adult_1910s avg_m_adult_1920s avg_m_adult_1930s avg_m_adult_1940s avg_m_adult_1950s 

avg_m_adult_1960s avg_m_adult_1970s avg_m_adult_1980s avg_m_adult_1990s avg_m_adult_2000s; 

run; 

  

**Now taking the merged data and making a proper table --> age group means by decade; 

data ag_dec ; 

  set dec_merged; 

   

  decade = 1900; 

  f_infant = f_inf_1900s; 

  f_child = f_chi_1900s; 

  f_teen = f_teen_1900s; 

  f_adult = f_adult_1900s; 

  m_infant = m_inf_1900s; 

  m_child = m_chi_1900s; 

  m_teen = m_teen_1900s; 

  m_adult = m_adult_1900s; 

  output; 

  

  decade = 1910; 

  f_infant = f_inf_1910s; 

  f_child = f_chi_1910s; 

  f_teen = f_teen_1910s; 

  f_adult = f_adult_1910s; 

  m_infant = m_inf_1910s; 

  m_child = m_chi_1910s; 

  m_teen = m_teen_1910s; 

  m_adult = m_adult_1910s; 

  output; 

   

  decade = 1920; 

  f_infant = f_inf_1920s; 

  f_child = f_chi_1920s; 

  f_teen = f_teen_1920s; 

  f_adult = f_adult_1920s; 

  m_infant = m_inf_1920s; 

  m_child = m_chi_1920s; 

  m_teen = m_teen_1920s; 

  m_adult = m_adult_1920s; 

  output; 

   

  decade = 1930; 

  f_infant = f_inf_1930s; 

  f_child = f_chi_1930s; 

  f_teen = f_teen_1930s; 

  f_adult = f_adult_1930s; 

  m_infant = m_inf_1930s; 

  m_child = m_chi_1930s; 

  m_teen = m_teen_1930s; 

  m_adult = m_adult_1930s; 

  output; 

  

  decade = 1940; 

  f_infant = f_inf_1940s; 

  f_child = f_chi_1940s; 

  f_teen = f_teen_1940s; 

  f_adult = f_adult_1940s; 

  m_infant = m_inf_1940s; 

  m_child = m_chi_1940s; 

  m_teen = m_teen_1940s; 

  m_adult = m_adult_1940s; 

  output; 

   

  decade = 1950; 

  f_infant = f_inf_1950s; 

  f_child = f_chi_1950s; 

  f_teen = f_teen_1950s; 

  f_adult = f_adult_1950s; 

  m_infant = m_inf_1950s; 

  m_child = m_chi_1950s; 

  m_teen = m_teen_1950s; 

  m_adult = m_adult_1950s; 

  output; 

   

  decade = 1960; 

  f_infant = f_inf_1960s; 

  f_child = f_chi_1960s; 

  f_teen = f_teen_1960s; 

  f_adult = f_adult_1960s; 

  m_infant = m_inf_1960s; 

  m_child = m_chi_1960s; 

  m_teen = m_teen_1960s; 

  m_adult = m_adult_1960s; 

  output; 

   

  decade = 1970; 

  f_infant = f_inf_1970s; 

  f_child = f_chi_1970s; 

  f_teen = f_teen_1970s; 

  f_adult = f_adult_1970s; 

  m_infant = m_inf_1970s; 

  m_child = m_chi_1970s; 

  m_teen = m_teen_1970s; 

  m_adult = m_adult_1970s; 

  output; 

   

  decade = 1980; 

  f_infant = f_inf_1980s; 

  f_child = f_chi_1980s; 

  f_teen = f_teen_1980s; 

  f_adult = f_adult_1980s; 

  m_infant = m_inf_1980s; 

  m_child = m_chi_1980s; 

  m_teen = m_teen_1980s; 

  m_adult = m_adult_1980s; 

  output; 

  

  decade = 1990; 

  f_infant = f_inf_1990s; 

  f_child = f_chi_1990s; 

  f_teen = f_teen_1990s; 

  f_adult = f_adult_1990s; 

  m_infant = m_inf_1990s; 

  m_child = m_chi_1990s; 

  m_teen = m_teen_1990s; 

  m_adult = m_adult_1990s; 

  output; 

   

  decade = 2000; 

  f_infant = f_inf_2000s; 

  f_child = f_chi_2000s; 

  f_teen = f_teen_2000s; 

  f_adult = f_adult_2000s; 

  m_infant = m_inf_2000s; 

  m_child = m_chi_2000s; 

  m_teen = m_teen_2000s; 

  m_adult = m_adult_2000s; 

  output; 

  

  DROP f_inf_1900s f_inf_1910s f_inf_1920s f_inf_1930s f_inf_1940s f_inf_1950s f_inf_1960s 

  f_inf_1970s f_inf_1980s f_inf_1990s f_inf_2000s 

  f_chi_1900s f_chi_1910s f_chi_1920s f_chi_1930s f_chi_1940s f_chi_1950s f_chi_1960s 

  f_chi_1970s f_chi_1980s f_chi_1990s f_chi_2000s 

  f_teen_1900s f_teen_1910s f_teen_1920s f_teen_1930s f_teen_1940s f_teen_1950s f_teen_1960s 

  f_teen_1970s f_teen_1980s f_teen_1990s f_teen_2000s _TYPE_ _FREQ_ 

  f_adult_1900s f_adult_1910s f_adult_1920s f_adult_1930s f_adult_1940s f_adult_1950s f_adult_1960s 

  f_adult_1970s f_adult_1980s f_adult_1990s f_adult_2000s 

  m_inf_1900s m_inf_1910s m_inf_1920s m_inf_1930s m_inf_1940s m_inf_1950s m_inf_1960s 

  m_inf_1970s m_inf_1980s m_inf_1990s m_inf_2000s 

  m_chi_1900s m_chi_1910s m_chi_1920s m_chi_1930s m_chi_1940s m_chi_1950s m_chi_1960s 

  m_chi_1970s m_chi_1980s m_chi_1990s m_chi_2000s 

  m_teen_1900s m_teen_1910s m_teen_1920s m_teen_1930s m_teen_1940s m_teen_1950s m_teen_1960s 

  m_teen_1970s m_teen_1980s m_teen_1990s m_teen_2000s 

  m_adult_1900s m_adult_1910s m_adult_1920s m_adult_1930s m_adult_1940s m_adult_1950s m_adult_1960s 

  m_adult_1970s m_adult_1980s m_adult_1990s m_adult_2000s; 

RUN; 

  

*Final table of age groups by decade and gender; 

proc print data = ag_dec noobs; 

Title "Female and Male Age Groups by Decade"; 

run; 

  

*Table of age group means by decade only; 

data agegroup_only; 

set complete_merge; 

infant = mean(m_infant, f_infant); 

child = mean(m_child, f_child); 

teen = mean(m_teen, f_teen); 

adult = mean(m_adult, f_adult); 

run; 

  

proc print data=agegroup_only; 

var year decade infant child teen adult; 

title "Age Groups by Decade"; 

run; 

  

*ANOVA of age group by decade; 

ods graphics on; 

proc glm data=agegroup_only; 

class decade; 

model infant child teen adult= decade; 

means decade/tukey; 

title "ANOVA of Age Group by Decade"; 

run; 

ods graphics off; 

  

*Box plots of age groups by gender over time; 

proc sgplot data=complete_merge; 

vbox f_infant / category=decade fillattrs=(color=gold) connect=median; 

vbox m_infant / category=decade fillattrs=(color=maroon)connect=median; 

yaxis label="Death Probability"; 

Title "Death Probabilities: Female Infant and Male Infant"; 

run; 

  

proc sgplot data=complete_merge; 

vbox f_child / category=decade fillattrs=(color=gold) connect=median; 

vbox m_child / category=decade fillattrs=(color=maroon)connect=median; 

yaxis label="Death Probability"; 

Title "Death Probabilities: Female Child and Male Child"; 

run; 

  

proc sgplot data=complete_merge;  

vbox f_teen / category=decade fillattrs=(color=gold) connect=median; 

vbox m_teen / category=decade fillattrs=(color=maroon)connect=median; 

yaxis label="Death Probability"; 

Title "Death Probabilities: Female Teen and Male Teen"; 

run; 

  

proc sgplot data=complete_merge;  

vbox f_adult / category=decade fillattrs=(color=gold) connect=median; 

vbox m_adult / category=decade fillattrs=(color=maroon)connect=median; 

yaxis label="Death Probability"; 

Title "Death Probabilities: Female Adult and Male Adult"; 

run; 

  

*Male vs Female DP; 

symbol1 value = circle color = blue I = none; 

symbol2 value = circle color = green I = none; 

symbol3 value = circle color = orange I = none; 

symbol4 value = circle color = purple I = none; 

proc gplot data = complete_merge; 

plot f_infant*m_infant=1 f_child*m_child=2 f_teen*m_teen=3 f_adult*m_adult=4; 

Title "Death Probabilities: Female vs Male by Age Group"; 

run; 

  

proc print data=complete_merge; 

var f_infant year decade; 

run; 

  
proc print data= complete_merge;
run;

*Kruskal-Wallis test; 

data adultmtof; 

set complete_merge; 

array adult[2] f_adult m_adult; 

do i = 1  to 2; 

dp_adult = adult[i]; 

if i = 1 then gender = 'female'; 

else gender = 'male'; 

output; 

end; 

keep year decade gender dp_adult; 

run; 
data adultmtof1;
set adultmtof;
ln_dp_adult= log(dp_adult);
if gender= "female" then sex=0;
else sex=1;
run;
proc print data= adultmtof1;
run;

proc reg data= adultmtof1;
model ln_dp_adult= year sex;
output out= predictmodel_adult predicted= lnhat;
run;

data untransform_adult;
set predictmodel_adult;
if sex=0 then
valuehat_adult1= exp(lnhat);
else
valuehat_adult2=exp(lnhat);

run;
proc print data= untransform_adult;
run;

proc sort data=untransform_adult;
by sex;
run;

symbol1 value=circle color=bibg; 
symbol2 color=blue i=join;
symbol3 color=red i=join; 
proc gplot data =untransform_adult;
Title "Death Probability for Male/Female Adults by year with predicted value overlay";
plot dp_adult*year=1 valuehat_adult1*year=2 valuehat_adult2*year=3/overlay;
run;
  

data infantmtof; 

set complete_merge; 

array infant[2] f_infant m_infant; 

do i = 1 to 2; 

dp_infant = infant[i]; 

if i = 1 then gender = 'female'; 

else gender = 'male'; 

output; 

end; 
keep year decade gender dp_infant lninfant_dp; 

run; 

data infantmtof1;
set infantmtof;
ln_dp_infant= log(dp_infant);
if gender= "female" then sex=0;
else sex=1;
run;
proc print data= infantmtof1;
run;

proc reg data= infantmtof1;
model ln_dp_infant= year sex;
output out= predictmodel predicted= lnhat;
run;

data untransform; 

set predictmodel; 

if sex=0 then 

valuehat_infant1= exp(lnhat); 

else 

valuehat_infant2=exp(lnhat); 

 

run; 

proc print data= untransform; 

run; 

  

proc sort data=untransform; 

by sex; 

run; 

symbol1 value=circle color=bibg;  

symbol2 color=blue i=join; 

symbol3 color=red i=join;  

proc gplot data =untransform; 
title "Death Probability for Male/Female infants by year with predicted value overlay";

plot dp_infant*year=1 valuehat_infant1*year=2 valuehat_infant2*year=3/overlay; 

run; 



data 
proc npar1way data = infantmtof wilcoxon; 

class gender; 

var dp_infant; 

run; 

  

proc npar1way data = adultmtof wilcoxon; 

class gender; 

var dp_adult; 

run; 

  

  

  

**************ANOVA*************; 

*ANOVA of Male to Female Infants and Adults;  

  

data ANOVA_mtof;  

set complete_merge;  

array agegroup[2] f_adult m_adult;  

do i = 1  to 2;  

dp = agegroup[i];  

if i = 1 then gender = 'female';  

else gender = 'male';  

output;  

end;  

keep year decade gender dp;  

run;  

  

proc glm data=ANOVA_mtof;  

class gender;  

model dp = gender;  

means gender/tukey;  

run;  

  

data infant_mtof;  

set complete_merge;  

array infant[2] f_infant m_infant;  

do i = 1  to 2;  

dp = infant[i];  

if i = 1 then gender = 'female';  

else gender = 'male';  

output;  

end;  

keep year decade gender dp;  

run;  

  

proc glm data=infant_mtof;  

class gender;  

model dp = gender;  

means gender/tukey;  

run;  

  

*Proc Corr; 

proc corr data=ag_dec pearson; 

var f_infant f_child f_teen f_adult m_infant m_child m_teen m_adult; 

Title "Correlation Matrix for M/F age groups from 1900-2010"; 

run; 

  

*Linear regression for Infant DP; 

ods graphics on; 

proc reg data = complete_merge; 

Model  f_infant = m_infant; 

Title "Linear Regression of Infant Death Probabilities (Female vs. Male)"; 

run; 

  

*Proc Loess for Adult DP; 

proc loess data = complete_merge; 

Model  f_adult = m_adult; 

Title "Proc Loess of Adult Death Probabilities (Female vs. Male)"; 

run; 

ods graphics off; 

  

*Cubed regression model for Adult DP; 

ods graphics on; 

proc reg data=complete_merge plots=predictions(x=m_adult); 

model f_adult = m_adult_cubed m_adult_sq m_adult; 

Title "Cubic Model Regression"; 

run; 

ods graphics off; 

  

*Non-linear regression of data (infant); 

ods graphics on; 

proc nlin data=complete_merge plots=diagnostics; 

*solve for a and b using y and x in y=a*e^(bx) 

	0.10319 = a*e^(1900b) or 0.00603 = a*e^(2000b) 

	Take ratio of the two --> get 0.10319/0.00603 = e^(-100b) 

	Take ln of both sides --> ln(0.10319/0.00603) = -100b 

	(1/-100) * ln(21.7/0.2) = b = -0.0284 

	Go back and plug in b into y=a*e^bx to get a 

	Answers: a = 2.80652 × 10^22, b = -0.0284; 

parameters a = 28065200000000000000000 b = -0.0284; 

model f_infant = a*exp(b*year); 

output out=firstmodel predicted = yhat; 

Title "Female Infant Nlin"; 

run; 

  

proc nlin data=complete_merge plots=diagnostics; 

parameters a = 28065200000000000000000 b = -0.0284; 

model m_infant = a*exp(b*year); 

output out=male_firstmodel predicted=myhat; 

Title "Male Infant Nlin"; 

run; 

ods graphics off; 

  

data db_infant; 

merge firstmodel male_firstmodel; 

by year; 

run; 

  

*Non-linear regression of Adult; 

ods graphics on; 

proc nlin data=complete_merge plots=diagnostics; 

parameters a = 4.476E10	 b = -0.0109997; 

model f_adult = a*exp(b*year); 

output out=secondmodel predicted = yhat; 

Title "Female Adult Nlin"; 

run; 

  

proc nlin data=complete_merge plots=diagnostics; 

parameters a =  4.476E10 b = -0.00998862; 

model m_adult = a*exp(b*year); 

output out=male_secondmodel predicted=myhat; 

Title "Male Adult Nlin"; 

run; 

ods graphics off; 

  

data db_infant; 

merge firstmodel male_firstmodel; 

by year; 

run; 

  

data db_adult; 

merge secondmodel male_secondmodel; 

by year; 

run; 

  

*Graphing Nlin; 

symbol1 value=circle color=pink; 

symbol2 value=none color=red i=join; 

symbol3 value=circle color=bibg; 

symbol4 value = none color=blue i=join; 

proc gplot data=db_infant; 

plot f_infant*year=1 yhat*year=2 m_infant*year=3 myhat*year=4/overlay; 

Title "Death Probabilities of Male and Female Infants (Nlin)"; 

run; 

  

symbol1 value=circle color=pink; 

symbol2 color=red i=join; 

symbol3 value=circle color=bibg; 

symbol4 color=blue i=join; 

proc gplot data=db_adult; 

plot f_adult*year=1 yhat*year=2 m_adult*year=3 myhat*year=4/overlay; 

Title "Death Probabilities of Male and Female Adults (Nlin)"; 

run; 

  

*Prepping dataset for log transformation; 

data logreg_inf; 

set complete_merge; 

lnf_infant = log(f_infant); 

lnm_infant = log(m_infant); 

lnf_adult = log(f_adult); 

lnm_adult = log(m_adult); 

run; 

proc print data= logreg_inf;
run;

ods graphics on; 

proc reg data = logreg_inf plots = predictions(x=year); 

model lnf_infant = year; 

output out = f_inf_log predicted = f_inf_yhat; 

Title "Proc Reg of ln(f_infant)"; 

  

proc reg data = logreg_inf plots = predictions(x=year); 

model lnm_infant = year; 

output out = m_inf_log predicted = m_inf_yhat; 

Title "Proc Reg of ln(m_infant)"; 

run; 

  

proc reg data = logreg_inf plots = predictions(x=year); 

model lnf_adult = year; 

output out = f_adu_log predicted = f_adu_yhat; 

Title "Proc Reg of ln(f_adult)"; 

run; 

  

proc reg data = logreg_inf plots = predictions(x=year); 

model lnm_adult = year; 

output out = m_adu_log predicted = m_adu_yhat; 

Title "Proc Reg of ln(m_adult)"; 

run; 

ods graphics off; 

  

*Prepping for log transformation graph; 

data untransform_f_inf; 

set f_inf_log; 

f_inf_hat = exp(f_inf_yhat); 

run; 

  

data untransform_m_inf; 

set m_inf_log; 

m_inf_hat = exp(m_inf_yhat); 

run; 

  

data untransform_inf; 

merge untransform_f_inf untransform_m_inf; 

by year; 

run; 

  

proc sort data = untransform_inf; 

by year; 

  

symbol1 value = circle color = pink; 

symbol2 value = none color = red I = join; 

symbol3 value=circle color=cornflowerblue; 

symbol4 value = none color=blue i=join; 

proc gplot data = untransform_inf; 

plot f_infant*year = 1 f_inf_hat*year = 2 m_infant*year=3 m_inf_hat*year=4/overlay legend; 

Title "Male and Female Infant Death Probabilities by Year (Log)"; 

run; 

  

data untransform_f_adu; 

set f_adu_log; 

f_adu_hat = exp(f_adu_yhat); 

run; 

  

data untransform_m_adu; 

set m_adu_log; 

m_adu_hat = exp(m_adu_yhat); 

run; 

  

data untransform_adu; 

merge untransform_f_adu untransform_m_adu; 

by year; 

run; 

  

proc sort data = untransform_adu; 

by year; 

  

symbol1 value = circle color = pink; 

symbol2 value = none color = red I = join; 

symbol3 value=circle color=cornflowerblue; 

symbol4 value = none color=blue i=join; 

proc gplot data = untransform_adu; 

plot f_adult*year = 1 f_adu_hat*year = 2 m_adult*year = 3 m_adu_hat*year=4/overlay legend; 

Title "Male and Female Adult Death Probabilities by Year (Log)"; 

run; 
