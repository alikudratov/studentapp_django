import random

rn = []
for x in range(1,10):
    rn.append(int(random.random()*100000))

#print(rn.count())

list = ['uz', 'ru', 'en']

print(rn)
print(sum(rn))
print(min(rn))
print(max(rn))
print(len(rn))
print(sorted(rn))


if 'uz' in list:
    print('Listda UZ tili mavjud')
else:
    print('Afsuski UZ tili listda yo`q')

dic = {'name':'alisher'}

#for x in list:
#    print(x)

#for x in range(1,6):
#    print(x)

#print(list[0])

#print(dic['name'])
#print(dic.keys())
#print(dic.items())
#print(dic.values())

names = 'alisher,jasur,ruslan'

list_names = names.upper().split(',')

#print(list_names)

i = 5
while i<=10:
    #print(i)
    i = i + 1