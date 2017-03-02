# ExGen

Code in working progress for 2 X 2 design. Design is Age x Task

Code is still in development and may have bugs. Data will be uploaded shortly. At the moment I am focussing on uploading code for figures

<h3> Experimental Design</h3>

ERP experiment involving two groups: N=24 Younger (18-25yrs) and N=24 Older (60+yrs) participants. Participants completed two tasks counterbalanced between participants. In the GENDER tasks participants completed a 2AFC Male versus Female categorisation of faces. In the EXNEX task participants completed a 2AFC Expressive ('Happy') versus non-Expressive ('neutral') categorisation of faces. 

<h3> Analysis Framework</h3>

We have used Bubbles sampling strategy to systematically sample the stimulus space across trials. We then use mutual information (MI) to understand the pixels statistically associated with behaviour and ERP modulations. Mutual information is a nonparametric measurement that quantifies in bits the depdendance between pairs of variables. 

<h3> Behaviural Permutation</h3>

Code for the following figure exists for illustrating group level behavioural permutations. First, MI is calculated for each participant, in each task (GENDER/ EXNEX) i) MI(pix, RT); ii) MI(pix, CORR). For permutation we shuffled participants' responses 1000 times whilst keeping the bubble masks constant. This allows us to establish statistical significant of mutual information. 

We can then illustrate these effects at the group level by creating a logical image where pixel value ranges from 0 to the number of participants showing an effect at that pixel. Both Younger and Older adults use pixels relating to the mouth region in the EXNEX task, whilst only some participants show significant effects in the eye regions for the GENDER task 

![alt tag](https://raw.githubusercontent.com/HLGilman/ExGen/master/README%20Figures/Permutation_Younger.jpg)

![alt tag](https://raw.githubusercontent.com/HLGilman/ExGen/master/README%20Figures/Permutation_Older.jpg)
