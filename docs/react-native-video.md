## Example of add fullscreen mode for [react-native-video](https://github.com/react-native-video/react-native-video)

The `react-native-video` library does not allow seamless switching to fullscreen mode due to the fact that the player instance will be created anew.

To avoid this, we can move the player view to another component branch so as not to create new instances of the player, and when fullscreen mode is not needed, we will return the player back.

```
import { View, StyleSheet } from 'react-native;
import Modal from 'react-native-modal'
import Video from 'react-native-video'
import { 
  PortalOrigin, 
  PortalDestination
} from "@alexzunik/rn-native-portals-reborn";

// our video controls component
import Controls from './controls'

const VideoPlayer = () => {
  const [isFullScreenMode, setFullScreenModeState] = useState(false);
  return (
    <View>
       <PortalOrigin destination={ isFullScreenMode ? 'fullscreen' : null }>
         <Video/>
       </PortalOrigin>
       <Controls />

       <Modal isVisible={isFullScreenMode}>
         <View style={StyleSheet.absoluteFill}>
           <PortalDestination name="fullscreen" />
           <Controls />
         </View>
       </Modal>
    </View>
  )
}

```
