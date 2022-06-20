import React, { ReactNode } from "react";

export type PortalOriginProps = {
  destination: string | null;
  children: ReactNode;
};

export type PortalDestinationProps = {
  name: string;
};

export class PortalOrigin extends React.Component<PortalOriginProps> {}
export class PortalDestination extends React.Component<PortalDestinationProps> {}
