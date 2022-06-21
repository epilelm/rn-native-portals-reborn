<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT license" />
  </a>
  <a href="http://img.shields.io/npm/v/@alexzunik/rn-native-portals-reborn.svg">
    <img src="http://img.shields.io/npm/v/react-native-inappbrowser-reborn.svg" alt="Current npm package version" />
  </a>
  <a href="https://npmjs.org/package/@alexzunik/rn-native-portals-reborn">
    <img src="http://img.shields.io/npm/dm/@alexzunik/rn-native-portals-reborn.svg" alt="Downloads" />
  </a>
  <a href="https://npmjs.org/package/@alexzunik/rn-native-portals-reborn">
    <img src="http://img.shields.io/npm/dt/@alexzunik/rn-native-portals-reborn.svg?label=total%20downloads" alt="Total downloads" />
  </a>
</p>

**:fire::fire::fire:This project is reborn of the [this project](https://github.com/mfrachet/rn-native-portals):fire::fire::fire:**

React Native implementation of [ReactDOM portals](https://reactjs.org/docs/portals.html) using a declarative API.

This library makes possible the _teleportation_ of views from a place to another one.

---

# Content

- <a href="#usage">How to use it ?</a>
- [Understanding the concept](./docs/CONCEPT.md)

<h1 name="#usage">Usage</h1>

### Installation

```
$ yarn add @alexzunik/rn-native-portals-reborn
```

for ios
```
$ npx pod-install
```

### In your code

Somewhere high in your component tree, add a `PortalDestination` (a portal destination):

```javascript
import {  PortalDestination } from "@alexzunik/rn-native-portals-reborn";

render() {
	return (
		<PortalDestination name="targetOfTeleportation" />
	);
}
```

Somewhere else in the tree, add a `PortalOrigin` (a portal origin):

```javascript
import { PortalOrigin } from '@alexzunik/rn-native-portals-reborn';

render() {
	return (
		<PortalOrigin destination={ this.state.shouldMove ? 'targetOfTeleportation' : null }>
			<View>
				<Text>Hello world</Text>
			</View>
		</PortalOrigin>
	);
}
```

When the `shouldMove` state will change to something truthy, the `View` and the `Text` components will be moved inside the `PortalDestination` component set
previously.

If the value of the `destination` prop is set to `null`, the `View` and `Text` are restituted to their original place.
