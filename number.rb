require 'sinatra'
require 'sinatra/reloader'

def int_check(n)
  if n.to_i <= 0
    1
  elsif n.to_i.to_s == n
    n.to_i
  elsif n.to_s == ''
    nil
  else
    1
  end
end

def fibonacci(n)
  if n == 1
    1
  elsif n == 2
    1
  else
    fibonacci(n-1) + fibonacci(n-2)
  end   
end

def factorial(n)
  (1..n).inject(:*) || 1
end

get '/' do
  fib = params['fib']
  fact = params['fact']
  n = params['n']
  
  #Calculate Fibonacci
  if(!fib.nil?)
    num = int_check(fib)
    if num.nil?
      #make fib nil so page doesn't render to result
      fib = nil
      fib_result = fibonacci(num)
    else
      #make fib nil so page doesn't render to result
      fib_result = fibonacci(num)
    end
  end
  
  #Calculate Factorial
  if(!fact.nil?)
    num = int_check(fact)
    if !num.nil?
      fact_result = factorial(num)
    else
      #make it so page doesn't render empty input
      fact = nil
    end
  end
  
  #Upcase name
  if(!n.nil?)
    puts n
    if(n.to_s == '')
      #make it so page doesn't render empty input
      n = nil
    else
      n = n.to_s.upcase
    end
  end
    
  #Render Page
  erb :index, :locals => {fib: fib, fib_result: fib_result, fact: fact, fact_result: fact_result, n: n}
end

not_found do
  status 404
  erb :error
end