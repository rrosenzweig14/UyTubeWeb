/**
 * WebServicesServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package WS;

public class WebServicesServiceLocator extends org.apache.axis.client.Service implements WS.WebServicesService {

    public WebServicesServiceLocator() {
    }


    public WebServicesServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public WebServicesServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for WebServicesPort
    private java.lang.String WebServicesPort_address = "http://localhost:9293/ws/uytube";

    public java.lang.String getWebServicesPortAddress() {
        return WebServicesPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String WebServicesPortWSDDServiceName = "WebServicesPort";

    public java.lang.String getWebServicesPortWSDDServiceName() {
        return WebServicesPortWSDDServiceName;
    }

    public void setWebServicesPortWSDDServiceName(java.lang.String name) {
        WebServicesPortWSDDServiceName = name;
    }

    public WS.WebServices getWebServicesPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(WebServicesPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getWebServicesPort(endpoint);
    }

    public WS.WebServices getWebServicesPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            WS.WebServicesPortBindingStub _stub = new WS.WebServicesPortBindingStub(portAddress, this);
            _stub.setPortName(getWebServicesPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setWebServicesPortEndpointAddress(java.lang.String address) {
        WebServicesPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (WS.WebServices.class.isAssignableFrom(serviceEndpointInterface)) {
                WS.WebServicesPortBindingStub _stub = new WS.WebServicesPortBindingStub(new java.net.URL(WebServicesPort_address), this);
                _stub.setPortName(getWebServicesPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("WebServicesPort".equals(inputPortName)) {
            return getWebServicesPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://WS/", "WebServicesService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://WS/", "WebServicesPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("WebServicesPort".equals(portName)) {
            setWebServicesPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
