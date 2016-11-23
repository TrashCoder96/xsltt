package xsltt;

import org.xml.sax.SAXException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;

/**
 * Created by itimofeev on 12.11.2016.
 */
public class XsltPoint {

    public static void main(String[] args) throws TransformerException, ParserConfigurationException, IOException, SAXException {
        Source xslt = new StreamSource(new File("doc.xslt"));
        Transformer transformer = TransformerFactory.newInstance().newTransformer(xslt);
        Source text = new StreamSource(new File("input.xml"));
        transformer.transform(text, new StreamResult(new File("output.html")));
    }

}
