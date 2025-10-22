import { Section } from '@expo/ui/swift-ui';
import { PropsWithChildren } from 'react';

interface LinkListSectionProps {
  title: string;
}

export function LinkListSection({
  title,
  children,
}: PropsWithChildren<LinkListSectionProps>) {
  return <Section title={title}>{children}</Section>;
}
