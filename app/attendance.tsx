import { Stack, useLocalSearchParams } from "expo-router";
import { View } from "react-native";
import { WebView } from 'react-native-webview';

export default function AttendanceScreen() {

    const { url } = useLocalSearchParams<{ url: string }>();
    const injectedJavaScript = ` (() => {
    if (location.href === 'https://kyomu.office.tut.ac.jp/portal/StudentApp/Top.aspx') {
        location.href = '${url}'
        return;
    }
    })();true;`;
    return (
        <>
            <Stack.Screen options={{ title: '出席登録' }} />
            <View style={{ flex: 1 }}>
                <WebView
                    style={{ flex: 1 }}
                    source={{ uri: 'https://kyomu.office.tut.ac.jp/portal/' }}
                    injectedJavaScript={injectedJavaScript}
                />
            </View>
        </>
    )
}

