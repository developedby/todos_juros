# todos_juros

PORTUGUÊS
=========
Este repositório é sobre codificar, em várias linguagens, a mesma solução em matemática financeira. Achar os juros a partir do acréscimo, das datas e pesos das parcelas. Eu uso o Método da Bisseção do Cálculo Numérico para resolver. A ideia é que cada versão se fixe ao máximo à cultura de cada linguagem. Eu uso o mínimo de recursos possível. Eu evito adicionar qualquer biblioteca que eu puder.

Dois conceitos que pesaram muito foram a exponenciação de números ponto flutuante (implementada em todas as linguagens) e os arrays dinâmicos (que não foram possíveis em Modula-2, Pascalzim, Portugol e VisuALG, onde os arrays têm mil elementos, ou três no caso de Modula-2).

Duas linguagens são consideradas diferentes quando qualquer parte do código tem que ser alterada para ser compilado ou interpretado em ambas.

As soluções estão dividas entre as recursivas (Clojure, Common Lisp, Elixir, Erlang, Haskell, Prolog, Racket e Scheme) e iterativas (todas as outras linguagens).

Existem, em algumas soluções, salvaguardas para valores incorretos para uma aplicação real. São valores zerados e negativos. Em algumas linguagens não é verificado, pois entendeu-se que o público-alvo dessas linguagens não cometeria esse tipo de equívoco.

Algumas implementações não serão mantidas, porque foram feitas em versões de avaliação de ambientes de desenvolvimento pagos, como o Embarcadero Delphi e o EiffelStudio.

A saída mais comum para os testes é:

Peso total = 3.0 / Acréscimo = 6.059108997379403 / Juros = 2.999999999999992

A lista está organizada em ordem alfabética pelos nomes das linguagens em: https://jacknpoeexplicaprogramacao.wordpress.com/2024/03/02/10-resolucoes-de-equacao-transcendente/ ou https://github.com/jacknpoe/todos_juros/blob/main/todos_juros.txt

A licença é GNU (https://www.gnu.org/licenses/gpl-3.0.html).

ENGLISH
=======
This repository is about coding, in multiple languages, the same solution in financial mathematics. Find the interest based on the increase, dates and weights of the installments. I use the Bisection Method of Numerical Calculation to solve. The idea is that each version adheres to the culture of each language as much as possible. I use as few resources as possible. I avoid adding any libraries I can.

Two concepts that weighed heavily were the exponentiation of floating point numbers (implemented in all languages) and dynamic arrays (which were not possible in Modula-2, Pascalzim, Portugol and VisuALG, where arrays have a thousand elements, or three in tne Modula-2 case).

Two languages ​​are considered different when any part of the code has to be changed to be compiled or interpreted in both.

The solutions are divided between recursive (Clojure, Common Lisp, Elixir, Erlang, Haskell, Prolog, Racket and Scheme) and iterative (all other languages).

There are, in some solutions, safeguards for incorrect values ​​for a real application. These are zero and negative values. In some languages ​​it is not verified, as it was understood that the target audience of these languages ​​would not make this type of mistake.

Some implementations will not be maintained because they were done in trial versions of paid development environments such as Embarcadero Delphi and EiffelStudio.

The most common output for tests is:

Peso total = 3.0 / Acréscimo = 6.059108997379403 / Juros = 2.999999999999992

The list is organized alphabetically by languages names: https://jacknpoeexplicaprogramacao.wordpress.com/2024/03/02/10-resolucoes-de-equacao-transcendente/ or https://github.com/jacknpoe/todos_juros/blob/main/todos_juros.txt

The license is GNU (https://www.gnu.org/licenses/gpl-3.0.html).
