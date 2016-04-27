import sys
orig_stdout = sys.stdout
import csv
File = open('file.csv')
f = open('fileOut.csv', 'w')
sys.stdout = f
Reader = csv.reader(File, delimiter='\t')
Data = list(Reader)

words = []
for row in Data:
	words.append(row[0])
	

min = len(words[0])
for x in range(1,len(words)):
	if len(words[x]) < min:
		min = len(words[x])
		
A = list(words[0])
for i in range(len(A)):
	for j in range(1,len(words)):
		B = list(words[j])
		if A[i] != B[i]:
		    lng = i - 1
		else:
			lng = min

string="";			
for word in words:
	if word[lng:]:
		print(word[lng:])
		
sys.stdout = orig_stdout
f.close()
