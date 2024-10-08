def levenstein(str_1, str_2):
    n, m = len(str_1), len(str_2)
    if n > m:
        str_1, str_2 = str_2, str_1
        n, m = m, n
    current_row = range(n + 1)
    for i in range(1, m + 1):
        previous_row, current_row = current_row, [i] + [0] * n
        for j in range(1, n + 1):
            add, delete, change = previous_row[j] + 1, current_row[j - 1] + 1, previous_row[j - 1]
            if str_1[j - 1] != str_2[i - 1]:
                change += 1
            current_row[j] = min(add, delete, change)
    distance = current_row[n]
    max_length = max(len(str_1), len(str_2))
    accuracy_percentage = (1 - distance / max_length) * 100
    return distance, accuracy_percentage
str1 = "Привет мир"
str2 = "Привет мир"
#1
print (f'Обычное сравнение\nПервое слово: {str1} \nВторое слово: {str2}')
print(levenstein(str1, str2))
#2
str1 = "Привет мир"
str2 = 'Привет мир!'
print (f"\nЧастичное сравнение\nПервое слово: {str1} \nВторое слово: {str2}")
print(levenstein(str1, str2))
#3
str1 = "Привет наш мир"
str2 = "наш Привет мир"
print(f"\nСравнение по токену\nПервое слово: {str1} \nВторое слово: {str2}")
print(levenstein(str1, str2))
#4
str1 = 'Привет мир'
str2= '!Привет, наш мир!'
print (f" \nПродвинутое обычное сравнение \nПервое слово: {str1} \nВторое слово: {str2}")
print(levenstein(str1, str2))
#5
str1 = 'Севастополь'
city = ["Москва", "Санкт-Петербург", "Саратов", "Краснодар", "Воронеж", "Омск", "Екатеринбург", "Севастополь", "Красногорск", "Красноярск"]
ans = sorted([[levenstein(str1, i), i] for i in city], key=lambda x: x[0])
print(f'\nСписок\nПервое слово: {str1} \n{ans}')


