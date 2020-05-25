

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";




CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(2, 'Hamza', '123456789', '2020-07-14 23:15:09');



CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'First', 1, 'A', '2020-05-12 21:35:40', NULL),
(2, 'second', 2, 'B', '2020-05-16 20:49:07', NULL);



CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(1, 1, 1, 9, 10, '2020-05-12 21:45:42', NULL),
(2, 1, 1, 4, 8, '2020-05-12 21:45:43', NULL),
(3, 1, 1, 5, 16, '2020-05-12 21:45:43', NULL),
(4, 1, 1, 2, 14, '2020-05-12 21:45:43', NULL),
(5, 1, 1, 3, 15, '2020-05-12 21:45:43', NULL),
(6, 1, 1, 1, 19, '2020-05-12 21:45:43', NULL),
(7, 1, 1, 7, 2, '2020-05-12 21:45:43', NULL),
(8, 1, 1, 8, 18, '2020-05-12 21:45:43', NULL),
(9, 1, 1, 6, 15, '2020-05-12 21:45:43', NULL),
(10, 4, 1, 9, 19, '2020-05-12 21:49:08', NULL),
(11, 4, 1, 4, 19, '2020-05-12 21:49:08', NULL),
(12, 4, 1, 5, 17, '2020-05-12 21:49:08', NULL),
(13, 4, 1, 2, 20, '2020-05-12 21:49:08', NULL),
(14, 4, 1, 3, 16, '2020-05-12 21:49:08', NULL),
(15, 4, 1, 1, 19, '2020-05-12 21:49:08', NULL),
(16, 4, 1, 7, 12, '2020-05-12 21:49:08', NULL),
(17, 4, 1, 8, 13, '2020-05-12 21:49:08', NULL),
(18, 4, 1, 6, 17, '2020-05-12 21:49:08', NULL),
(19, 2, 1, 9, 13, '2020-05-12 21:50:34', NULL),
(20, 2, 1, 4, 16, '2020-05-12 21:50:34', NULL),
(21, 2, 1, 5, 12, '2020-05-12 21:50:34', NULL),
(22, 2, 1, 2, 23, '2020-05-12 21:50:34', NULL),
(23, 2, 1, 3, 23, '2020-05-12 21:50:34', NULL),
(24, 2, 1, 1, 23, '2020-05-12 21:50:34', NULL),
(25, 2, 1, 7, 56, '2020-05-12 21:50:34', NULL),
(26, 2, 1, 8, 19, '2020-05-12 21:50:34', NULL),
(27, 2, 1, 6, 17, '2020-05-12 21:50:34', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `RollId` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `DOB`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(1, 'HAMZA HMIMED', '123', 'hamza.hmimed05@gmail.com', 'Male', '1997-11-03', 1, '2020-05-12 21:42:33', NULL, 1),
(2, 'hassan berrada', '124', 'hassan.berrada@gmail.com', 'Male', '1998-12-04', 1, '2020-05-12 21:43:02', NULL, 1),
(3, 'sara aitkadir', '125', 'sara12@gmail.com', 'Female', '52003-02-03', 1, '2020-05-12 21:43:35', NULL, 1),
(4, 'hajar fahmy', '126', 'hajzar.fa@gmail.com', 'Female', '2001-03-09', 1, '2020-05-12 21:44:14', NULL, 1);





CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(1, 1, 1, 1, '2020-05-12 21:40:58', NULL),
(2, 1, 2, 1, '2020-05-12 21:41:04', NULL),
(3, 1, 3, 1, '2020-05-12 21:41:08', NULL),
(4, 1, 4, 1, '2020-05-12 21:41:13', NULL),
(5, 1, 5, 1, '2020-05-12 21:41:18', NULL),
(6, 1, 6, 1, '2020-05-12 21:41:23', NULL),
(7, 1, 7, 1, '2020-05-12 21:41:28', NULL),
(8, 1, 8, 1, '2020-05-12 21:41:34', NULL),
(9, 1, 9, 1, '2020-05-12 21:41:39', NULL);



CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'MATH', '1', '2020-05-12 21:37:37', NULL),
(2, 'HISTORY', '2', '2020-05-12 21:37:52', NULL),
(3, 'INFORMATIQUE', '3', '2020-05-12 21:38:04', NULL),
(4, 'ENGLESH', '4', '2020-05-12 21:38:33', NULL),
(5, 'FRENSH', '5', '2020-05-12 21:38:42', NULL),
(6, 'SPORT', '6', '2020-05-12 21:38:49', NULL),
(7, 'PHILOSOPHIE', '7', '2020-05-12 21:38:58', NULL),
(8, 'physics', '8', '2020-05-12 21:39:59', NULL),
(9, 'BIOLOGIE', '9', '2020-05-12 21:40:12', NULL);


ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);


ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;


ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

