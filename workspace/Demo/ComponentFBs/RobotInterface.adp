<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE AdapterType SYSTEM "http://www.holobloc.com/xml/LibraryElement.dtd">
<AdapterType Comment="Adapter Interface" Name="RobotInterface">
  <Identification Standard="61499-1"/>
  <VersionInfo Author="Duc Do Tran" Date="2020-03-21" Organization="OFFIS e.V." Version="1.0"/>
  <CompilerInfo header="package fb.test;"/>
  <InterfaceList>
    <EventInputs>
      <Event Comment="Request from Socket" Name="X1" Type="Event"/>
      <Event Comment="Response from Socket" Name="X2" Type="Event"/>
      <Event Comment="" Name="Y1" Type="Event"/>
      <Event Comment="" Name="Y2" Type="Event"/>
      <Event Comment="" Name="Go" Type="Event"/>
      <Event Comment="" Name="Gc" Type="Event"/>
    </EventInputs>
    <EventOutputs>
      <Event Comment="Indication from Plug" Name="StartMotor" Type="Event">
        <With Var="LoadIn"/>
      </Event>
      <Event Comment="" Name="StopMotor" Type="Event"/>
      <Event Comment="" Name="ReqCx" Type="Event">
        <With Var="DirLinX"/>
      </Event>
      <Event Comment="" Name="ReqCy" Type="Event">
        <With Var="DirLinY"/>
      </Event>
      <Event Comment="" Name="ReqCg" Type="Event">
        <With Var="DirGrip"/>
      </Event>
    </EventOutputs>
    <OutputVars>
      <VarDeclaration Comment="" Name="LoadIn" Type="REAL"/>
      <VarDeclaration Comment="" Name="DirLinX" Type="BOOL"/>
      <VarDeclaration Comment="" Name="DirLinY" Type="BOOL"/>
      <VarDeclaration Comment="" Name="DirGrip" Type="BOOL"/>
    </OutputVars>
  </InterfaceList>
  <Service Comment="Adapter Interface" LeftInterface="SOCKET" RightInterface="PLUG">
    <ServiceSequence Comment="" Name="request_confirm">
      <ServiceTransaction>
        <InputPrimitive Event="REQ" Interface="SOCKET" Parameters="REQD"/>
        <OutputPrimitive Event="REQ" Interface="PLUG" Parameters="REQD"/>
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Event="CNF" Interface="PLUG" Parameters="CNFD"/>
        <OutputPrimitive Event="CNF" Interface="SOCKET" Parameters="CNFD"/>
      </ServiceTransaction>
    </ServiceSequence>
    <ServiceSequence Comment="" Name="indication_response">
      <ServiceTransaction>
        <InputPrimitive Event="IND" Interface="PLUG" Parameters="INDD"/>
        <OutputPrimitive Event="IND" Interface="SOCKET" Parameters="INDD"/>
      </ServiceTransaction>
      <ServiceTransaction>
        <InputPrimitive Event="RSP" Interface="SOCKET" Parameters="RSPD"/>
        <OutputPrimitive Event="RSP" Interface="PLUG" Parameters="RSPD"/>
      </ServiceTransaction>
    </ServiceSequence>
  </Service>
</AdapterType>
