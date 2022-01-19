#!/usr/bin/env python

## SUGGESTED CODING STYLE
## Python encourages PEP 8 style (see http://www.python.org/dev/peps/pep-0008/
## SALIENT POINTS:

##	* Use 4-space indentation, and no tabs.
##	* 4 spaces are a good compromise between small indentation (allows greater 
##		nesting depth) and large indentation (easier to read). 
##		Tabs introduce confusion, and are best left out.
##	* Wrap lines so that they don.t exceed 79 characters.
##	* This helps users with small displays and makes it possible to have 
##		several code files side-by-side on larger displays.
##	* Use blank lines to separate functions and classes, and larger blocks of 
##		code inside functions.
##	* When possible, put comments on a line of their own.
##	* Use docstrings.
##	* Use spaces around operators and after commas, but not directly inside 
##		bracketing constructs: a = f(1, 2) + g(3, 4).
##	* Name your classes and functions consistently; the convention is to use 
##		CamelCase for classes and lower_case_with_underscores for functions 
##		and methods. Always use self as the name for the first method 
##		argument (see A First Look at Classes for more on classes and methods).
## 	* Don.t use fancy encodings if your code is meant to be used in international 
##		environments. Plain ASCII works best in any case.


##-----------------------------------------------------
## The following examples are from python tutorial 
## at http://docs.python.org/2/tutorial/index.html
##-----------------------------------------------------

##3.x
a,b = 0,1
while b < 100:
	print b
	a,b = b,a+b


##-----------------------------------------------------
## Chap4: Control Flow 
##-----------------------------------------------------
#4.1  if
x = int(raw_input("Enter an intger: "))
if x < 0:
	x = 0;
	print 'Negative changed to zero'
elif x == 0:
	print 'zero'
else:
	print 'More'


#4.2  for
words = ['cat', 'mouse', 'house']
for w in words:
	print w, len(w)

for w in words[:]: 	#Loops over a slice copy of the entire list
	if len(w) > 2:
		words.insert(0, w)

#4.3 range
a = ['Mary', 'had', 'a', 'little', 'lamb']
for i in range(len(a)):
     print i, a[i]

#4.4 break/continue
for n in range(2, 10):
     for x in range(2, n):
         if n % x == 0:
             print n, 'equals', x, '*', n/x
             break
     else:
         # loop fell through without finding a factor
         print n, 'is a prime number'

for num in range(2, 10):
     if num % 2 == 0:
         print "Found an even number", num
         continue
     print "Found a number", num


#4.5 pass
while True:
	pass	# Do nothing

class myEmptyClass
	pass

def initlog(*args):
	pass



# 4.6-4.7 : Defining Functions
def fib(n):
	"""Documentation String
	Usage: fib(n)
		Returns the fibnacci series."""
	if (n == 0):
		print fib.__doc__
		return(None)
	result = []
	a,b = 0,1
	while a < n:
		#print a
		result.append(a)
		a, b = b, a+b
	return(result)

print fib(0)

# Using default argument values and keyword arguments
def ask_ok(prompt, retries=4, complaint='Yes or no, please!'):
    while True:
        ok = raw_input(prompt)
        if ok in ('y', 'ye', 'yes'):
            return True
        if ok in ('n', 'no', 'nop', 'nope'):
            return False
        retries = retries - 1
        if retries < 0:
            raise IOError('refusenik user')
        print complaint

ask_ok('Do you really want to quit ?',6, 'Invalid!')

##Passing dictinary arguments
def cheeseshop(kind, *arguments, **keywords):
    print "-- Do you have any", kind, "?"
    print "-- I'm sorry, we're all out of", kind
    for arg in arguments:
        print arg
    print "-" * 40
    keys = sorted(keywords.keys())
    for kw in keys:
        print kw, ":", keywords[kw]


cheeseshop("Limburger", "It's very runny, sir.", "It's really very, VERY runny, sir.", shopkeeper='Michael Palin', client="John Cleese", sketch="Cheese Shop Sketch")

## For arbitray argument list and lambda forms see the tutorial
