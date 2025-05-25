import { useEffect, useState } from 'react';
import { Dimensions } from 'react-native';

export function useWindowDimensions() {
  const [window, setWindow] = useState(Dimensions.get('window'));

  useEffect(() => {
    const subscription = Dimensions.addEventListener('change', ({ window }) => {
      setWindow(window);
    });
    return () => {
      subscription.remove();
    };
  }, []);

  return window;
}
