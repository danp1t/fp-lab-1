def is_leap_year(year):
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

def days_in_month(month, year):
    if month in [4, 6, 9, 11]:
        return 30
    elif month == 2:
        if is_leap_year(year): return 29  
        else: return 28
    else:
        return 31
    
def count_sundays(input_year):
    day_of_week = 1
    sunday_count = 0

    for year in range(1900, input_year + 1):
        for month in range(1, 13):
            if day_of_week % 7 == 0 and year >= 1901:
                sunday_count += 1
            day_of_week += days_in_month(month, year)
    
    return sunday_count
