using Google.Apis.Drive.v3.Data;
using HotelBooking.App_Start;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Hotel;
using HotelBooking.DataLayer.Models.User;
using HotelBooking.DataLayer.ViewModels.Hotel;
using HotelBooking.DataLayer.ViewModels.User;
using log4net;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HotelBooking.Controllers
{
    public class HotelController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(UserController));
       // private static string usertypemessage = "";
        private static string usermessage = "";
        #region Room
        [SessionTimeout]
        public ActionResult Index(int? id)
        {
            #region Notifications
            if (usermessage == "Insert")
            {
                ViewBag.message = "Success: Data Created Succesfully";
            }
            else if (usermessage == "Update")
            {
                ViewBag.message = "Success: Data Updated Succesfully";
            }
            else if (usermessage == "Delete")
            {

                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else if (usermessage == "Active")
            {

                ViewBag.message = "Success: Data Activated Succesfully";
            }
            else
            {
                ViewBag.message = usermessage;
            }

            usermessage = "";
            #endregion

            #region All Rooms
            var rooms = HotelBookingDBAccess.AllRooms();
            var roomListView = new AllRoomsViewModel();
            roomListView.Rooms=rooms;
            #endregion

            #region Create Room
            var newentry = new HotelRoomDetailsCreateViewModel();
            roomListView.newentry = newentry;
            #endregion

            #region Update Room
            var updateentry = new UpdateHotelRoomDetailsViewModel();


            if (id != 0 && id != null)
            {
                var roominfo = HotelBookingDBAccess.GetRoomById((int)id);

                updateentry.PkRoomDetailsId = roominfo.PkRoomDetailsId;
                updateentry.RoomCode = roominfo.RoomCode;
                updateentry.RoomDetails = roominfo.RoomDetails;
                updateentry.RentPerRoom = roominfo.RentPerRoom;

            }
            roomListView.updateentry = updateentry;
            #endregion

            return View(roomListView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(AllRoomsViewModel model, string Create, string Update)
        {
            if (!string.IsNullOrEmpty(Create))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            if (model != null)
                            {
                                HotelRoomDetails newRoom = new HotelRoomDetails();
                                newRoom.RoomCode = model.newentry.RoomCode;
                                newRoom.RoomDetails = model.newentry.RoomDetails;
                                newRoom.RentPerRoom = model.newentry.RentPerRoom;
                                newRoom.CreatedAt = System.DateTime.Now.AddHours(11);
                                newRoom.UpdatedAt = System.DateTime.Now.AddHours(11);
                                newRoom.CreatedBy = Session["Email"].ToString();
                                newRoom.UpdatedBy = Session["Email"].ToString();
                                newRoom.DeletedBy = "";
                                newRoom.Status = true;
                                databaseModel.hotelRoomDetails.Add(newRoom);
                                databaseModel.SaveChanges();
                                // dbTran.Commit();
                                if (newRoom.PkRoomDetailsId > 0)
                                {

                                    dbTran.Commit();
                                    usermessage = "Insert";
                                    return RedirectToAction("Index");
                                }
                                else
                                {
                                    dbTran.Rollback();
                                    usermessage = "Failed";
                                    return RedirectToAction("Index");
                                }

                            }
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            usermessage = "Failed";
                            return RedirectToAction("Index", "User");
                        }
                    }
                }
            }
            else if (!string.IsNullOrEmpty(Update))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var roominfo = HotelBookingDBAccess.GetRoomById(model.updateentry.PkRoomDetailsId);
                            if (roominfo != null)
                            {
                                var newmodel = databaseModel.hotelRoomDetails.Where(m => m.PkRoomDetailsId == model.updateentry.PkRoomDetailsId).FirstOrDefault();
                                if (newmodel != null)
                                {
                                    newmodel.RoomCode = model.updateentry.RoomCode;
                                    newmodel.RoomDetails = model.updateentry.RoomDetails;
                                    newmodel.RentPerRoom = model.updateentry.RentPerRoom;
                                    newmodel.UpdatedAt = System.DateTime.Now.AddHours(11);
                                    newmodel.UpdatedBy = Session["Email"].ToString();
                                    databaseModel.SaveChanges();
                                    dbTran.Commit();
                                    usermessage = "Update";
                                    return RedirectToAction("Index", new { id = 0 });
                                }
                            }
                            dbTran.Rollback();
                            usermessage = "Failed";
                            return RedirectToAction("Index", new { id = 0 });
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            usermessage = "Failed";
                            return RedirectToAction("Index", new { id = 0 });
                        }
                    }
                }

            }
            return View(model);
        }

        [SessionTimeout]

        public ActionResult DeleteRoom(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var roominfo = HotelBookingDBAccess.GetRoomById(id);
                        if (roominfo.Status == true)
                        {
                            var v = databaseModel.hotelRoomDetails.Where(m => m.PkRoomDetailsId == id).FirstOrDefault();
                            if (v != null)
                            {
                                databaseModel.hotelRoomDetails.Remove(v);
                                databaseModel.SaveChanges();

                                dbTran.Commit();
                                usermessage = "Delete";
                                return RedirectToAction("Index", "Hotel");
                            }
                            dbTran.Rollback();
                        }

                        usermessage = "Failed";
                        return RedirectToAction("Index", "Hotel");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        usermessage = "Failed";
                        return RedirectToAction("Index", "Hotel");
                    }
                }
            }
        }

    }
}
#endregion