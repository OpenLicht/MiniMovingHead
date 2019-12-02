<?xml version="1.0" encoding="ASCII"?>
<ResourceModel:App xmi:version="2.0" xmlns:xmi="http://www.omg.org/XMI" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ResourceModel="http://www.infineon.com/Davex/Resource.ecore" name="CCU4_SLICE_CONFIG" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1" description="The CCU4_SLICE_CONFIG configures and initializes a CCU4 timer slice.&#xA;The Capture/Compare Unit 4 (CCU4) is a major component for systems that need general purpose timers for signal monitoring/conditioning and Pulse Width Modulation (PWM) signal generation." mode="NOTSHARABLE" version="4.0.16" minDaveVersion="4.3.2" instanceLabel="CCU4_SLICE_CONFIG_TOP" appLabel="" containingProxySignal="true">
  <properties provideInit="true"/>
  <virtualSignals name="ccu4_global_signal" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_config_global" hwSignal="global_signal" hwResource="//@hwResources.0"/>
  <virtualSignals name="event_period_match" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_period_match_interrupt" hwSignal="pmus_omds" hwResource="//@hwResources.0" required="false"/>
  <virtualSignals name="event_cmp_match" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_compare_match_interrupt" hwSignal="cmds_cmus" hwResource="//@hwResources.0" required="false"/>
  <virtualSignals name="event_in0" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_event0_interrupt" hwSignal="e0as" hwResource="//@hwResources.0" required="false"/>
  <virtualSignals name="event_in1" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_event1_interrupt" hwSignal="e1as" hwResource="//@hwResources.0" required="false"/>
  <virtualSignals name="event_in2" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_event2_interrupt" hwSignal="e2as" hwResource="//@hwResources.0" required="false"/>
  <virtualSignals name="st" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_st" hwSignal="st" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="out" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_out" hwSignal="out" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="ps" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_ps" hwSignal="ps" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="in0" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_gp0_unsync" hwSignal="gp0_unsync" hwResource="//@hwResources.0" visible="true">
    <upwardMapList xsi:type="ResourceModel:Connections" href="../../DIGITAL_IO/v4_0_16/DIGITAL_IO_0.app#//@connections.2"/>
  </virtualSignals>
  <virtualSignals name="in1" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_gp1_unsync" hwSignal="gp1_unsync" hwResource="//@hwResources.0" visible="true">
    <upwardMapList xsi:type="ResourceModel:Connections" href="../../DIGITAL_IO/v4_0_16/DIGITAL_IO_0.app#//@connections.3"/>
  </virtualSignals>
  <virtualSignals name="in2" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_gp2_unsync" hwSignal="gp2_unsync" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="gp0" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_gp0" hwSignal="gp0" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="gp1" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_gp1" hwSignal="gp1" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="gp2" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_gp2" hwSignal="gp2" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="link_out" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_concat_bus_out" hwSignal="concat_bus_out" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="link_in" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_concat_bus_in" hwSignal="concat_bus_in" hwResource="//@hwResources.0" visible="true"/>
  <virtualSignals name="mci" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_mci" hwSignal="mci" hwResource="//@hwResources.0"/>
  <virtualSignals name="mcss" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_mcss" hwSignal="mcss" hwResource="//@hwResources.0"/>
  <requiredApps URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/app_global_ccu4" requiredAppName="GLOBAL_CCU4" requiringMode="SHARABLE">
    <downwardMapList xsi:type="ResourceModel:App" href="../../GLOBAL_CCU4/v4_1_12/GLOBAL_CCU4_0.app#/"/>
  </requiredApps>
  <hwResources name="CCU40 Config" URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/hwres_ccu4_cc4_slice" resourceGroupUri="peripheral/ccu4/0/cc4/2" constraintType="GLOBAL_RESOURCE" mResGrpUri="peripheral/ccu4/*/cc4/*">
    <downwardMapList xsi:type="ResourceModel:ResourceGroup" href="../../../HW_RESOURCES/ccu40/ccu40_0.dd#//@provided.25"/>
  </hwResources>
  <connections URI="http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_global/http://resources/4.0.16/app/CCU4_SLICE_CONFIG/1/vs_ccu4_cc4_config_global" systemDefined="true" sourceSignal="ccu4_global" targetSignal="ccu4_global_signal" targetVirtualSignal="//@virtualSignals.0" proxySrcVirtualSignalUri="http://resources/4.1.12/app/GLOBAL_CCU4/0/vs_global_ccu4_globalsignal" containingProxySignal="true">
    <downwardMapList xsi:type="ResourceModel:VirtualSignal" href="../../GLOBAL_CCU4/v4_1_12/GLOBAL_CCU4_0.app#//@virtualSignals.0"/>
    <srcVirtualSignal href="../../GLOBAL_CCU4/v4_1_12/GLOBAL_CCU4_0.app#//@virtualSignals.0"/>
  </connections>
</ResourceModel:App>