![](https://img.shields.io/badge/Microverse-blueviolet)

# Advanced Building Blocks - Enumerable Methods

[Collaborative project]

> In this project, we are implementing own version of Ruby’s enumerable methods.

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
