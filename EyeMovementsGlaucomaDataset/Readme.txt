==================================================================================
v0.01

To cite this dataset, or for more details see the accompanying manuscript:
"Data on Eye movements of Glaucoma Patients: a Case control Study"

For the original paper for which these data were gathered, see:

Crabb, D. P., Smith, N. D. & Zhu, H. What’s on TV? Detecting age-related neurodegenerative eye disease using eye movement scanpaths. Front. Aging Neurosci. 6, 1–10 (2014).


Version History:
0.1   12/04/2018   DA   Initial upload
==================================================================================


==================================================================================
Information regarding directory structure and file contents:
==================================================================================

1) Participant details.csv
This file has eight fields, describing participant's ID, the eye used in the experiment, visual field 
mean deviation (MD) measurements, age, sex, visual acuity (VA) measures (in LogMAR units), and contrast sensitivity (CS)
measures (in Log units). The VA and CS measures described are for the eye used in the study.

2) Raw eye movement data (folder)
	a) Control -  32 asc files
	b) Glaucoma – 44 asc files
The .asc eye movement files are extracted from the EyeLink EDF files using an application provided by Eyelink. 
These raw data contain all eye movement and related information including eye movement events such as, button presses, blinks, 
and synchronization signals. The asc files can be opened using text processing soft wares such as Notepad.

3) Processed  eye movement data (folder)
	a) Control – 32 csv files
	b) Glaucoma – 44 csv files
Each csv in the subfolders describe fixations and saccades, which are extracted from the raw asc files using a bespoke C++ program.
Saccades were identified using velocity and acceleration thresholds of 30 degrees/s and 8000 degrees/s, respectively. While fixations
were computed as the average position of the gaze points between successive saccades.

It should be noted that data from five controls (C019 - C023) and one patient (G010) are incomplete.It is up to the user to consider these data in their analysis.

4) SaccadeAmplitudePlot.m Matlab script to plot saccade amplitude for each trail using the processed eye movement data. 
Sample saccade amplitude plots for three participants are shown in Saccade_amplitude.png

5) Visual field data (folder)
	a) 24-2 VF Controls.csv
	b) 24-2 VF Glaucoma.csv

These files are the 54 point sensitivity values obtained from the 24-2 field tests. Both the left and right eyes of each 
participant were tested during the days of the experiment. The 54 point sensitivity values in numeric dB graph are vectorized, where the values are concatenated
starting from the first row (top row)  to the last (bottom) row as illustrated below. The vectorization procedure was similar for both eyes.



  	RIGHT  												LEFT

				 1	2   |	3	4								 1	2   |	3	4
					    |											    |
			5	6	7   | 	8	9	10						5	6	7   | 	8	9	10
					    |											    |
		11	12	13	14  | 	15	16	17	18				11	12	13	14  | 	15	16	17	18
					    |											    |
	19	20	21	22	23  |	24	25	26	27				19	20	21	22  |	23  24	25	26	27
	____________________________________|_____________________________				____________________________|______________________________
					    |											    | 		
	28	29	30	31	32  |	33	34	35	36				28	29	30	31  |	32  33	34	35	36
					    |											    |	
		37	38	39	40  |	41	42	43	44				37	38	39	40  |	41	42	43	44
					    |											    |
			45	46	47  |	48	49	50						45	46	47  |	48	49	50
					    |											    |	
				51	52  |	53	54								51	52  |	53	54