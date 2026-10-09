using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Xml;
using System.Xml.Xsl;

namespace XML_reisid.Pages
{
    public class ReisidModel : PageModel
    {
        public string XmlResult { get; set; } = "";

        private readonly IWebHostEnvironment _environment;

        public ReisidModel(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        public void OnGet()
        {
            string xmlPath = Path.Combine(
                _environment.ContentRootPath,
                "XML",
                "Reis.xml"
            );

            string xsltPath = Path.Combine(
                _environment.ContentRootPath,
                "XSLT",
                "ReisParing.xslt"
            );

            XslCompiledTransform transform = new XslCompiledTransform();

            transform.Load(xsltPath);

            using (StringWriter writer = new StringWriter())
            using (XmlReader reader = XmlReader.Create(xmlPath))
            {
                transform.Transform(reader, null, writer);

                XmlResult = writer.ToString();
            }
        }
    }
}