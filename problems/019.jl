
function leapyear(year)
    if year % 100 == 0
        return year % 400 == 0
    else
        return year % 4 == 0
    end
end

function monthdays(month, year)
    if month ∈ [4, 6, 9, 11]
        return 30
    elseif month == 2
        return leapyear(year) ? 29 : 28
    else
        return 31
    end
end

begin
    year = 1900
    month = 1
    weekday = 1
    counter = 0
    while year < 2001
        if year > 1900 && year < 2001 && weekday == 0
            println("Sunday, the 1st of $month, $year")
            counter += 1
        end
        weekday += monthdays(month, year)
        weekday %= 7
        month += 1
        if month == 13
            month = 1
            year += 1
        end
    end
end