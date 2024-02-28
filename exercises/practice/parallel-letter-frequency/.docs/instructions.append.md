# ignore

## Concurency vs. Parallelism

Wren provides _concurrency_ via a construct called _fibers_.
From the Wren manual:

> Fibers are a bit like threads except they are cooperatively scheduled.
> That means Wren doesn’t pause one fiber and switch to another until you tell it to.

Wren's execution is single-threaded so we don't actually get _parallelism_.

Here's a quick definition for each that illustrates the diferences between the two:

- Concurrency is when two or more tasks can start, run and complete in overlapping time periods, being executed by the same processing unit.
- Parallelism is when two or more tasks can start and run at the same time, being executed independently of eachother by separate processing units.

Read more about [concurrency in Wren][concurrency].

[concurrency]: https://wren.io/concurrency.html
