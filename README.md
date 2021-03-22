![](https://img.shields.io/badge/Microverse-blueviolet)

# Advanced Building Blocks - Enumerable Methods

[Collaborative project]

> In this project, we are implementing our version of Ruby's enumerable methods.

Covered methods

- #my_each
- #my_each_with_index
- #my_select
- #my_all?
- #my_any?
- #my_none?
- #my_count
- #my_map
- #my_inject
- #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

## Built With

- Ruby

## Getting Started

Clone

```git
git clone git@github.com:marijanbrvar/Enumerables.git
```

To get a local copy up and running, follow these simple example steps.


1. Open a terminal window and enter `fit clone https://github.com/marijanbrvar/BubbleSort.git`
2. Make your new cloned directory your active directory
3. Currently, you are in the "development branch."
4. Change your current branch to enumerables branch `git checkout enumerables`
5. Use `irb` to test folder with following console command `irb -I . -r enumerable.rb`
6. Once you are in the irb console, use the syntax to invoke the method stated below

### Prerequisites

Ruby installed localy

### Usage

Use IRB to test the code
#### my_select

```irb
[1,2,3,4,5,6].my_select(&:even?)
=> [2,4,6]
```

#### my_all?

```irb
[1,2,3,4,5,6].my_all?(&:even?)
=> false
```

#### my_any?

```irb
[1,2,3,4,5,6].my_any?(&:odd?)
=> true
```

#### #my_none?

```irb
[1,2,3,4,5,6].my_none?(&:odd?)
=> true
```

#### #my_count

```irb
[1,2,3].my_count
=> 3
[1,2,3].my_count { |x| x > 1}
=> 2
```

#### #my_map

```irb
[1,5].my_map { |x| x * 2 }
=> [2, 10]

[1,2,3,4,5].my_map Proc.new { |x| x * 4 }
=> [4,8,12,16,20]
```

#### #my_inject

```irb
(5..10).my_inject(:+)
=> 45
(5..10).my_inject { |sum, n| sum + n }
=> 45
```

#### #multiply_els

```irb
[1,2,4,5,6].my_multiply_els
=> 240
```

## Authors

👤 **Marijan Brvar**

![Marijan's GitHub stats](https://github-readme-stats.vercel.app/api?username=marijanbrvar&count_private=true&theme=dark&show_icons=true)


- GitHub: [@githubhandle](https://github.com/marijanbrvar)
- Twitter: [@twitterhandle](https://twitter.com/marijanbrvar)
- LinkedIn: [LinkedIn](https://linkedin.com/in/marijanbrvar)

👤 **Tanzila**

![Tanzila's GitHub stats](https://github-readme-stats.vercel.app/api?username=tanzila-abedin&count_private=true&theme=dark&show_icons=true)

- GitHub: [@githubhandle](https://github.com/tanzila-abedin)
- Twitter: [@twitterhandle](https://twitter.com/TanzilaAbedin)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/tanzila-abedin-331440b2/)

## 📝 License

This project is [MIT](LICENSE) licensed.
