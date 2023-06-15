<img align="right" width="250" height="250" top="100" src="./README.png">

# seapot

seaport with [noir](https://noir-lang.org/)

currently only struct, enums, and consts from [seaport-types](https://github.com/ProjectOpenSea/seaport-types)

will pull over more where it makes sense

> disclaimer: mostly translated using regex & gpt, so probs not perfect

## usage

1. Add the library to your Noir project dependencies in the `Nargo.toml` file.

```toml
[dependencies]
seapot = {tag = "v1.5.1-alpha", git = "https://github.com/sambarnes/seapot"}
```

2. Import the library into your Noir code.

```rust
use dep::std;
use dep::seapot;

fn main(){
    let foo = seapot::enums::ItemType::ERC721;
    std::println(foo);
}

#[test]
fn test_main() {
    main();
}

```

> credit [@colinnielsen](https://github.com/colinnielsen) and [@critesjosh](https://github.com/critesjosh/noir-lib-demo)  for this section
