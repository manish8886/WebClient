package servlets;


import servlets.CountryInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
/**
 *
 * @author Manish
 */
public class XmlParser {
   static List<CountryInfo> Parse(String path) {
        List<CountryInfo> listCountry = new ArrayList<CountryInfo>();
        try {
            SAXReader xmlReader = new SAXReader();
            Document doc = xmlReader.read(path);
            String xPath = "//countryXML";
            List listOfNode = doc.selectNodes(xPath);
            Iterator iter = listOfNode.iterator();
            while (iter.hasNext()) {
                Node rowElement = (Node) iter.next();
                CountryInfo countryOb = new CountryInfo();
                String unCode = rowElement.selectSingleNode("uncode").getText();
                String name = rowElement.selectSingleNode("name").getText();
                String capital = rowElement.selectSingleNode("capital").getText();
                String population = rowElement.selectSingleNode("population").getText();
                String gdptotal = rowElement.selectSingleNode("gdptotal").getText();
                String landarea = rowElement.selectSingleNode("landarea").getText();
                String hdi = rowElement.selectSingleNode("hdi").getText();

                countryOb.setUnCode(unCode);
                countryOb.setNameEN(name);
                countryOb.setNameCapital(capital);
                countryOb.setPopulation(population);
                countryOb.setGdpTotal(gdptotal);
                countryOb.setLandarea(landarea);
                countryOb.setHdi(hdi);
                listCountry.add(countryOb);
            }
            return listCountry;
        } catch (DocumentException E) {
            System.out.println("Error in opening the url in insertFromFullSrc Fun: " + E);
            return listCountry;
        }

    }
}
