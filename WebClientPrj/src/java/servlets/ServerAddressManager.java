/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Manish
 */
public class ServerAddressManager {
    Map<String,String>uriMap;
    public ServerAddressManager() {
        uriMap = new HashMap<String, String>();
        uriMap = new HashMap<String, String>();
        uriMap.put(InputParam.COUNTRYINFOBTN, "http://localhost:8080/WebServerPrj/webresources/generic/countryinfo/");
        //uriMap.put(InputParam.SHOWMAPBTN, null);
        uriMap.put(InputParam.AREBORDERCOUNTRIESBTN,"http://localhost:8080/WebServerPrj/webresources/generic/checkborder/");
        uriMap.put(InputParam.SORTCOUNTRYBTN,"http://localhost:8080/WebServerPrj/webresources/generic/orderBy/" );
        uriMap.put(InputParam.FINDCOUNTRYBYPOSBTN,"http://localhost:8080/WebServerPrj/webresources/generic/frompos/");
        //uriMap.put(InputParam.FINDNEIGHBOURCAPITALSBTN, null);/Yet To be Implemented
        //uriMap.put(InputParam.CLASSIFYCOUNTRYBTN, null);/Yet To be Implemented
    }
    public String getURL(String key){
        return (String)uriMap.get(key);
    }
    
}
