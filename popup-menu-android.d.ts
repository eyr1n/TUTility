declare module '@react-native/popup-menu-android' {
  export type PopupMenuAndroidInstance = {
    readonly show: () => void;
  };

  type Props = {
    menuItems: Array<string>;
    onSelectionChange: (item: number) => void;
    onDismiss: () => void;
    children: React.ReactNode | undefined;
    instanceRef: React.RefObject<PopupMenuAndroidInstance | null>;
  };

  export default class PopupMenuAndroid extends React.Component<Props> {}
}
