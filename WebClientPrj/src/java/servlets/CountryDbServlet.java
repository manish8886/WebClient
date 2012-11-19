/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.BufferedReader;
import servlets.CountryInfo;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
@WebServlet(name = "CountryDbServlet", urlPatterns = {"/CountryDbServlet"})
public class CountryDbServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CountryDbServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CountryDbServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CountryInfo> countries = new ArrayList<CountryInfo>();
        Map<String, String[]> paramMap = request.getParameterMap();
        ServerAddressManager urlManager = new ServerAddressManager();
        String strURL="";
        if (paramMap.containsKey(InputParam.COUNTRYINFOBTN)) {
            strURL = urlManager.getURL(InputParam.COUNTRYINFOBTN);
            String countryName = paramMap.get(InputParam.COUNTRYLISTBOX)[0];
            String countryName1 = request.getParameter(InputParam.COUNTRYLISTBOX);
            strURL =strURL+countryName; 
            countries= XmlParser.Parse(strURL);
            request.setAttribute("countries", countries);
     
        }else if(paramMap.containsKey(InputParam.SHOWMAPBTN)){
            //For now it is empty
        }else if(paramMap.containsKey(InputParam.AREBORDERCOUNTRIESBTN)){
            strURL = urlManager.getURL(InputParam.AREBORDERCOUNTRIESBTN);
            String strCountryFirst = paramMap.get(InputParam.CHECKBORDERCOUNTRYFIRSTEDITBOX)[0];
            String strCountrySecond = paramMap.get(InputParam.CHECKBORDERCOUNTRYSECONDEDITBOX)[0];
            strURL = strURL+strCountryFirst+"/"+strCountrySecond;
            String strResponse = new String();
            
            URL server = new URL(strURL);
            BufferedReader in = new BufferedReader(new InputStreamReader(server.openStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                strResponse=strResponse+inputLine;
            }
            in.close();
            request.setAttribute("strResponse", strResponse);

        }else if(paramMap.containsKey(InputParam.SORTCOUNTRYBTN)){
            strURL = urlManager.getURL(InputParam.SORTCOUNTRYBTN);
            String btnName = request.getParameter(InputParam.SORTINGCRITERIANAME);
            String topCheckBox = request.getParameter(InputParam.ORDERCHECKBOX);
            Integer nTop = new Integer(1);
            if(topCheckBox==null){
                nTop =0;
            }
            if(btnName.equalsIgnoreCase(InputParam.POPULATIONRADIOBTNVAL)){
                strURL= strURL+"population/";
            }else if(btnName.equalsIgnoreCase(InputParam.GDPRADIOBTNVAL)){
                strURL= strURL+"gdp/";
            }else if(btnName.equalsIgnoreCase(InputParam.LANDAREARADIOBTNVAL)){
                strURL= strURL+"landarea/";
            }else{
                strURL= strURL+"hdi/";
            }
            strURL = strURL + nTop.toString();
            countries = XmlParser.Parse(strURL);
            request.setAttribute("countries", countries);
        } else if (paramMap.containsKey(InputParam.FINDCOUNTRYBYPOSBTN)) {
            String strLat = paramMap.get(InputParam.FINDCOUNTRYLATPOSEDITBOX)[0];
            String strLon = paramMap.get(InputParam.FINDCOUNTRYLONGEDITBOX)[0];
            strURL = strURL + strLat + "/" + strLon;
            countries = XmlParser.Parse(strURL);
            request.setAttribute("countries", countries);
            
        }else if(paramMap.containsKey(InputParam.FINDNEIGHBOURCAPITALSBTN)){
            //Yet to be omplemented
        }else{
            //Yet to be implemented classify
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
