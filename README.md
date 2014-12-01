## The longest sentence [WIP]

Hello. This is a piece of software that was written with the aim of creating
the longest grammatically valid sentence ever produced.

I think it worked. You can read the sentence [here](sentences/sentence_1.txt).

I'm going to spend a little more time and work making the sentence more detailed
and intricate.

Follow me at [@neoeno](http://twitter.com/neoeno) maybe.

### Quickstart

You'll need ruby, bundler.

```bash
$ bundle install
$ ruby go.rb
```

### How it works

It parses a subset of a tagged version of [the Brown corpus](http://en.wikipedia.org/wiki/Brown_Corpus)
and sorts every word into a bucket according to its type.

When that's done, you can give it a sentence structure to replicate. Currently,
it uses something like this:

```ruby
['np', 'bedz', '@the', 'jjt', 'nn']
# Proper noun, was, the, superlative, singular/mass noun
# Brian was the biggest horse.
```

In this case, it uses a sentence stucture which can be extended to infinity, e.g.

> Alpha was the highest sense of the hottest ton, the closest ebony of the
> strongest possibility, the highest-paid fraternity of the youngest suit,
> the best exhibit of the lowest keynote, the best meat of the worthiest
> privilege, the closest opposition of the fastest selection, the fiercest
> mantle of the richest appreciation [...]

### Next

I want to broaden the sentence structures to include recursive structures, e.g.

> Alpha, the dog who watched TV at the pub last thursday, was highest sense of
> the hottest [...]

It's all infinite, but some infinites are more interesting than others...
