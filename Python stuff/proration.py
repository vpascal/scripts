def expenses(rank, students, credits):

	salary={'Full Professor': 2780,
    'Associate Professor': 2592,
    'Assistant Professor': 2362,
    'Senior Lecturer': 2333,
    'Associate Lecturer': 2279,
    'Lecturer': 2224, 
    'Group 3: Phd': 1075,
    'Group 3: MA': 1000,
    'Group 3: Other': 890   
	}

	if db(db.description.programtype =='Doctorate') and rank =="Full Professor" and students<12:
		salary = (students/12)*salary['Full Professor']*credits
	else:
		salary = 2780*credits	

	return salary
    print()