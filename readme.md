# Lotus: Launch First, Ask Questions Later

**Lotus** is a blockchain built using Cosmos SDK and Tendermint and created with [Starport](https://github.com/tendermint/starport).

We came upon a situation where due to starport's ease of use, it was now possible for an entirely new class of developers to begin launching layer one blockchains using the Cosmos SDK.

With that said, these developers didn't really know exactly what they were building, infrastructure wise. Lotus is a project that will get both developers and business teams exposure to exactly what's being built when building a blockchain with the Cosmos SDK.

In brief, when building a chain with the Cosmos SDK, you are building:

* A network of nodes
* A sovereign entity
* A blockchain that can speak to other blockchains using the IBC protocol
* A blockchain that can access liquidity from day one by connecting to dexes in the cosmos ecosystem
* A community

This is to be an example of community first blockchain development. Essentially, Lotus' development begins with the community and ends in a software development effort. All of the code here has been scaffolded using the Starport tool. Instead of specializing this chain in any way by adding types or anything else to it, it has been left completely plain. It is a blank slate, a tabula rasa.

**PS:** That's both before and after launch, if you want to contribute code to baby before baby's birth, go for it!

## Get started

```
starport serve
```

`serve` command installs dependencies, builds, initializes, and starts your blockchain in development.

## Configure

Your blockchain in development can be configured with `config.yml`. To learn more, see the [Starport docs](https://docs.starport.network).

## Launch

To launch your blockchain live on multiple nodes, use `starport network` commands. Learn more about [Starport Network](https://github.com/tendermint/spn).

## Web Frontend

Starport has scaffolded a Vue.js-based web app in the `vue` directory. Run the following commands to install dependencies and start the app:

```
cd vue
npm install
npm run serve
```

The frontend app is built using the `@starport/vue` and `@starport/vuex` packages. For details, see the [monorepo for Starport front-end development](https://github.com/tendermint/vue).


## Partners
- [ionomy Exchange](https://ionomy.com/)
![NEW_ionomyPrimarylight](https://user-images.githubusercontent.com/71132155/118725842-78ba8d00-b7fe-11eb-95cb-71cfffa0941e.png)

- [Dandelion Labs](https://dandelionlabs.io/)
<img alt="Dandelion Labs - Blockchain Product and Research Agency" src="https://dandelionlabs.io/wp-content/uploads/2021/05/logo-dandelion-labs@4x.png" height="70px">


- [Blockchain Hanoi](https://blockchainhanoi.org/)
<img alt="Blockchain Hanoi - Community and Events" src="https://blockchainhanoi.org/wp-content/uploads/2021/05/blockchain_hanoi_logo@4x.png" height="70px">

- [Neo](https://neo.co/) <img alt="Neo" src="https://media-exp3.licdn.com/dms/image/C560BAQFMvXAcjdLhvQ/company-logo_200_200/0/1602110473139?e=2159024400&v=beta&t=RCp7MbF5AwUsr43rO9BpzpcH3r7KnNl2NHAkMnT7TDU">

- [DFY and ⛏️](https://defi.com.vm)

- [🤬 Witnesses](https://ecosynthesizer.com/blurt/witnesses)

- [👟 An1]


## Learn more

- [Starport](https://github.com/tendermint/starport)
- [Starport Docs](https://docs.starport.network)
- [Cosmos SDK documentation](https://docs.cosmos.network)
- [Cosmos SDK Tutorials](https://tutorials.cosmos.network)
- [Discord](https://discord.gg/W8trcGV)
