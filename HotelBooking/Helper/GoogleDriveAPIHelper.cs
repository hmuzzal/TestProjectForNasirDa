using System;
using System.Web.Mvc;
using log4net;
using System.Web;
using System.IO;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v3;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using Google.Apis.Auth.OAuth2.Mvc;
using System.Threading;
using Google.Apis.Auth.OAuth2.Flows;


namespace HotelBooking.Helper
{
    public class GoogleDriveAPIHelper : FlowMetadata
    {

        private static readonly ILog Log = LogManager.GetLogger(typeof(GoogleDriveAPIHelper));
        //add scope
        public static string[] Scopes = { DriveService.Scope.Drive };

        private static readonly IAuthorizationCodeFlow flow =
            new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
            {
                ClientSecrets = new ClientSecrets
                {
                    ClientId = "768832935265-079938hfoc739ur2k3dabqstu2ql7p6g.apps.googleusercontent.com",
                    ClientSecret = "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"
                },
                Scopes = new[] { DriveService.Scope.Drive },
                DataStore = new FileDataStore("Drive.Api.Auth.Store")
            });

        
        public override IAuthorizationCodeFlow Flow
        {
            get { return flow; }
        }
        //create Drive API service.
        [Obsolete]
        public static DriveService GetService()
        {
            UserCredential credential;
           // Root Folder of project
            var CSPath = System.Web.Hosting.HostingEnvironment.MapPath("~/");
            using (var stream = new FileStream("credentials.json", FileMode.Open, FileAccess.Read))
            {
                
                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None).Result;
            }

            //// Authenticate the user
            //credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
            //    clientSecrets,
            //    new[] { DriveService.Scope.Drive },
            //    "user",
            //    System.Threading.CancellationToken.None).Result;

            //create Drive API service.
            DriveService service = new Google.Apis.Drive.v3.DriveService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "Backup",
            });

            // Make API calls
            var files = service.Files.List().Execute().Files;

            return service;
        }

        //public static List<GoogleDriveFiles> GetDriveFiles() 
        //{ 

        //}

        //file Upload to the Google Drive root folder.
        [Obsolete]
        public static void UplaodFileOnDrive(HttpPostedFileBase file)
        {
            if (file != null && file.ContentLength > 0)
            {
                //create service
                DriveService service = GetService();
                string path = Path.Combine(HttpContext.Current.Server.MapPath("~/GoogleDriveFiles"),
                Path.GetFileName(file.FileName));
                file.SaveAs(path);
                var FileMetaData = new Google.Apis.Drive.v3.Data.File();
                FileMetaData.Name = Path.GetFileName(file.FileName);
                FileMetaData.MimeType = MimeMapping.GetMimeMapping(path);
                FilesResource.CreateMediaUpload request;
                using (var stream = new System.IO.FileStream(path, System.IO.FileMode.Open))
                {
                    request = service.Files.Create(FileMetaData, stream, FileMetaData.MimeType);
                    request.Fields = "id";
                    request.Upload();
                }
            }
        }

        /// <summary>
        /// Upload new file.
        /// </summary>
        /// <param name="filePath">Image path to upload.</param>
        /// <returns>Inserted file metadata if successful, null otherwise.</returns>
        public static string DriveUploadBasic(string filePath)
        {
            try
            {
                /* Load pre-authorized user credentials from the environment.
                 TODO(developer) - See https://developers.google.com/identity for
                 guides on implementing OAuth2 for your application. */
                GoogleCredential credential = GoogleCredential.GetApplicationDefault()
                    .CreateScoped(DriveService.Scope.Drive);

                // Create Drive API service.
                var service = new DriveService(new BaseClientService.Initializer
                {
                    HttpClientInitializer = credential,
                    ApplicationName = "Drive API Snippets"
                });

                // Upload file photo.jpg on drive.
                var fileMetadata = new Google.Apis.Drive.v3.Data.File()
                {
                    Name = "photo.jpg"
                };
                FilesResource.CreateMediaUpload request;
                // Create a new file on drive.
                using (var stream = new FileStream(filePath,
                           FileMode.Open))
                {
                    // Create a new file, with metadata and stream.
                    request = service.Files.Create(
                        fileMetadata, stream, "image/jpeg");
                    request.Fields = "id";
                    request.Upload();
                }

                var file = request.ResponseBody;
                // Prints the uploaded file id.
                Console.WriteLine("File ID: " + file.Id);
                return file.Id;
            }
            catch (Exception e)
            {
                // TODO(developer) - handle error appropriately
                if (e is AggregateException)
                {
                    Console.WriteLine("Credential Not found");
                }
                else if (e is FileNotFoundException)
                {
                    Console.WriteLine("File not found");
                }
                else
                {
                    throw;
                }
            }
            return null;
        }

        public override string GetUserId(Controller controller)
        {
            return "databasebackup11040@gmail.com";
        }
    }
}