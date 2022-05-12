using MaterialSkin;
using MaterialSkin.Controls;

namespace Messenger
{
    public partial class frmMain : MaterialForm
    {
        private static frmMain _instance;
        public static frmMain Instance
        {
            get
            {
                if (_instance == null)
                    _instance = new frmMain();
                return _instance;
            }
        }
        public frmMain()
        {
            InitializeComponent();
            MaterialSkinManager manager = MaterialSkinManager.Instance;
            manager.AddFormToManage(this);
            manager.Theme = MaterialSkinManager.Themes.LIGHT;
            manager.ColorScheme = new ColorScheme(Primary.Blue400, Primary.Blue500, Primary.Blue500, Accent.LightBlue200, TextShade.WHITE);

        }
        public Panel Content
        {
            get {return MainContainer; }
            set { MainContainer = value; }
        }
        private void frmMain_Load(object sender, System.EventArgs e)
        {
            _instance = this;
            MainContainer.Controls.Add(new uclogin() { Dock = DockStyle.fill })
        }

        private void panel1_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
        {

        }
    }
}
