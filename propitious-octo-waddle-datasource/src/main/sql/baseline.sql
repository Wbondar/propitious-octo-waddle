-- Tables.

CREATE TABLE accounts
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	username VARCHAR(100) NOT NULL UNIQUE,
	password TEXT NOT NULL
)
;

INSERT INTO accounts (id, username, password)
VALUES (DEFAULT, 'WBOND', '$2a$10$tBKUC4uRZ/M41FC6ej5N3uHrtsAYTFIryGTp6bNllKg6N3xcV8xH6')
;

CREATE TABLE task_types
(
	id SMALLSERIAL NOT NULL PRIMARY KEY,
	class_name VARCHAR(100) NOT NULL UNIQUE
)
;

INSERT INTO task_types (id, class_name)
VALUES 
(1, 'ChoiceMultiple'),
(2, 'ChoiceSingle')
;

CREATE TABLE tasks
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	type_id SMALLINT NOT NULL,
	description TEXT NOT NULL,
	FOREIGN KEY (type_id) REFERENCES task_types (id)
)
;

-- Placeholder.
INSERT INTO tasks (id,type_id,description) 
VALUES (1,1,'consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante.'),(2,2,'aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh.'),(3,1,'nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum'),(4,2,'eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus'),(5,1,'mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper'),(6,1,'Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis'),(7,1,'libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies'),(8,1,'quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed'),(9,2,'dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim'),(10,2,'facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor'),(11,1,'a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque'),(12,1,'mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum'),(13,2,'sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus'),(14,2,'Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede'),(15,1,'parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque.'),(16,1,'aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,'),(17,1,'porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum.'),(18,2,'risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis'),(19,1,'eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis'),(20,1,'Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse'),(21,1,'turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat'),(22,2,'lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class'),(23,2,'lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel'),(24,1,'lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet'),(25,1,'ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non'),(26,2,'fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet'),(27,2,'Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus'),(28,2,'fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet'),(29,2,'risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor'),(30,2,'nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu'),(31,2,'consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas,'),(32,1,'posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac,'),(33,2,'ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus'),(34,2,'erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante'),(35,1,'placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus'),(36,1,'nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis'),(37,2,'pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse'),(38,1,'vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh.'),(39,1,'Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,'),(40,1,'ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim.'),(41,1,'facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a'),(42,2,'dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis.'),(43,1,'dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit'),(44,2,'libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,'),(45,1,'Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id'),(46,2,'sodales elit erat vitae risus. Duis a mi fringilla mi lacinia'),(47,2,'vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor'),(48,2,'elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et'),(49,2,'Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl.'),(50,1,'sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem'),(51,1,'sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin'),(52,1,'ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat.'),(53,1,'lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere'),(54,1,'ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam'),(55,1,'imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin'),(56,2,'Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit,'),(57,2,'lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel'),(58,1,'malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc'),(59,2,'eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis.'),(60,1,'arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit'),(61,1,'eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean'),(62,2,'blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non'),(63,1,'sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris'),(64,2,'vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque'),(65,2,'dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec'),(66,2,'Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae'),(67,1,'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus'),(68,2,'Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus'),(69,1,'pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse'),(70,2,'ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas'),(71,1,'tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut'),(72,2,'varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat'),(73,1,'mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris'),(74,2,'orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet'),(75,2,'fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec'),(76,2,'dictum eleifend, nunc risus varius orci, in consequat enim diam vel'),(77,2,'Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna'),(78,1,'cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique'),(79,2,'ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero.'),(80,2,'nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec'),(81,2,'condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus'),(82,1,'id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.'),(83,1,'pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi'),(84,2,'risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class'),(85,2,'In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas.'),(86,1,'magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis'),(87,1,'pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis'),(88,2,'eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et'),(89,1,'semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus'),(90,1,'eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum.'),(91,1,'felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit'),(92,1,'nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus'),(93,1,'odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet,'),(94,1,'Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer'),(95,2,'eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec'),(96,1,'mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna.'),(97,2,'mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis'),(98,1,'In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis'),(99,2,'a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam'),(100,2,'amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget');

CREATE TABLE options
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	task_id BIGINT NOT NULL,
	description TEXT NOT NULL,
	reward SMALLINT NOT NULL,
	FOREIGN KEY (task_id) REFERENCES tasks (id)
)
;

-- Placeholder.
INSERT INTO options (id,task_id,description,reward) VALUES (1,73,'eu odio',1),(2,44,'ullamcorper.',1),(3,41,'fringilla,',1),(4,78,'malesuada',0),(5,19,'montes,',1),(6,20,'diam',0),(7,81,'Cras dictum ultricies',0),(8,54,'dapibus',1),(9,5,'nunc',1),(10,69,'volutpat. Nulla',1),(11,9,'lacus. Mauris non',0),(12,2,'Cum sociis',0),(13,39,'purus',1),(14,30,'Proin',0),(15,87,'Morbi neque tellus,',0),(16,36,'sem magna',1),(17,3,'cursus, diam',0),(18,4,'torquent',0),(19,23,'condimentum. Donec at',1),(20,62,'dolor.',1),(21,9,'eget,',0),(22,64,'pharetra nibh.',1),(23,96,'augue, eu tempor',1),(24,100,'euismod',0),(25,16,'quam',1),(26,35,'orci. Phasellus',0),(27,83,'Phasellus',1),(28,69,'vulputate',0),(29,75,'sed',1),(30,75,'Quisque',0),(31,96,'interdum.',1),(32,47,'commodo',1),(33,73,'Nam interdum enim',0),(34,3,'tempus risus.',0),(35,63,'Cum sociis',0),(36,40,'Duis',0),(37,60,'ullamcorper,',1),(38,91,'orci lobortis',0),(39,14,'Nullam',1),(40,1,'lacinia',0),(41,23,'sapien, gravida',0),(42,44,'ut, pharetra sed,',1),(43,65,'interdum',0),(44,50,'non,',0),(45,55,'non, lacinia at,',0),(46,81,'eget nisi dictum',0),(47,42,'enim. Mauris quis',1),(48,84,'diam at',0),(49,60,'Duis mi enim,',0),(50,12,'vulputate',1),(51,85,'pharetra, felis',1),(52,100,'ipsum. Phasellus',1),(53,31,'Integer',1),(54,55,'tellus eu augue',1),(55,43,'Praesent luctus. Curabitur',1),(56,79,'Donec egestas. Aliquam',1),(57,25,'nec enim.',1),(58,60,'semper egestas, urna',0),(59,95,'vitae',1),(60,11,'eget,',0),(61,68,'a felis',1),(62,65,'massa.',0),(63,38,'Donec',1),(64,9,'mus. Donec',1),(65,51,'commodo',0),(66,45,'velit. Aliquam',0),(67,33,'mus. Proin',0),(68,17,'neque. In',0),(69,58,'tortor',0),(70,15,'nisi',0),(71,15,'Aliquam ultrices iaculis',0),(72,56,'sit',0),(73,80,'lectus ante dictum',0),(74,77,'ultrices posuere cubilia',1),(75,59,'sodales purus, in',1),(76,42,'pharetra',1),(77,42,'aliquam',1),(78,7,'neque sed',1),(79,41,'malesuada ut, sem.',0),(80,26,'rutrum, justo.',0),(81,51,'pharetra ut,',0),(82,57,'turpis',0),(83,92,'ante',1),(84,45,'pellentesque eget, dictum',0),(85,3,'hendrerit neque.',0),(86,39,'tincidunt adipiscing. Mauris',0),(87,15,'Donec',1),(88,71,'placerat. Cras dictum',1),(89,9,'Curabitur massa. Vestibulum',1),(90,61,'dolor egestas rhoncus.',0),(91,20,'ridiculus mus. Aenean',0),(92,88,'nonummy',0),(93,49,'in',0),(94,74,'Quisque ac libero',0),(95,38,'egestas blandit. Nam',0),(96,93,'Morbi metus. Vivamus',1),(97,84,'amet diam',1),(98,29,'elit, pretium et,',1),(99,40,'neque tellus,',0),(100,18,'ultrices. Duis',1);

CREATE TABLE pools
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE
)
;

-- Placeholder.
INSERT INTO pools (id,title) VALUES (1,'vel, mauris. Integer sem elit,'),(2,'Duis cursus, diam at pretium'),(3,'commodo ipsum. Suspendisse non leo.'),(4,'iaculis odio. Nam interdum'),(5,'tellus'),(6,'condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus'),(7,'Vestibulum ante ipsum primis in faucibus orci luctus'),(8,'Suspendisse ac metus vitae velit egestas lacinia.'),(9,'adipiscing fringilla, porttitor'),(10,'Quisque libero lacus,'),(11,'vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam'),(12,'lacus. Etiam bibendum fermentum metus. Aenean sed'),(13,'dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer'),(14,'montes, nascetur ridiculus mus. Donec dignissim magna'),(15,'Quisque nonummy ipsum non arcu. Vivamus sit amet risus.'),(16,'Mauris non dui nec urna suscipit nonummy. Fusce fermentum'),(17,'mauris blandit mattis. Cras eget'),(18,'neque et nunc. Quisque ornare tortor'),(19,'eros.'),(20,'Suspendisse dui. Fusce diam nunc, ullamcorper eu,'),(21,'sem ut'),(22,'vulputate, lacus.'),(23,'Vivamus euismod urna. Nullam'),(24,'velit justo nec'),(25,'risus. Quisque'),(26,'Morbi quis urna. Nunc quis arcu vel'),(27,'faucibus leo, in lobortis tellus justo sit amet'),(28,'Fusce'),(29,'interdum. Nunc sollicitudin commodo ipsum.'),(30,'arcu. Morbi sit amet massa. Quisque'),(31,'cubilia Curae; Phasellus'),(32,'sit amet, consectetuer adipiscing elit. Aliquam auctor, velit'),(33,'quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar');

CREATE TABLE pools_tasks
(
	pool_id BIGINT NOT NULL,
	task_id BIGINT NOT NULL,
	PRIMARY KEY (pool_id, task_id),
	FOREIGN KEY (pool_id) REFERENCES pools (id),
	FOREIGN KEY (task_id) REFERENCES tasks (id)
)
;

-- Placeholder.
INSERT INTO pools_tasks (pool_id,task_id) VALUES (7,99),(10,96),(31,53),(12,64),(30,34),(33,84),(29,100),(23,62),(12,66),(4,59),(20,89),(23,50),(25,83),(4,91),(31,52),(13,12),(13,24),(10,86),(2,31),(16,98),(1,70),(9,88),(7,50),(3,28),(33,39),(11,55),(22,3),(9,33),(16,75),(33,62),(9,46),(9,54),(22,28),(16,96),(17,58),(9,66),(9,97),(13,89),(27,30),(3,45),(22,64),(12,4),(30,14),(33,80),(5,57),(14,50),(24,38),(28,49),(14,79),(22,34),(13,43),(21,58),(11,73),(23,16),(21,59),(14,64),(23,18),(30,5),(30,96),(26,80),(25,7),(14,37),(33,90),(32,60),(23,90),(13,40),(21,9),(32,64),(13,20),(5,3),(24,64),(7,97),(13,79),(13,45),(13,34),(30,95),(22,90),(4,88),(3,2),(7,28),(9,50),(17,68),(13,27),(10,38),(2,40),(32,22),(16,99),(25,16),(5,48),(10,89),(30,6),(9,62),(19,41),(19,95),(26,4),(32,24),(23,63);

CREATE TABLE exams
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	title VARCHAR(100) NOT NULL UNIQUE
)
;

-- Placeholder.
INSERT INTO exams (id,title) VALUES (1,'adipiscing lacus. Ut nec'),(2,'vestibulum.'),(3,'Morbi accumsan laoreet ipsum. Curabitur consequat,'),(4,'aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque'),(5,'fringilla. Donec feugiat metus sit amet ante.'),(6,'pede, nonummy ut, molestie'),(7,'Nulla aliquet. Proin velit. Sed malesuada augue'),(8,'urna.'),(9,'mauris, rhoncus id, mollis nec, cursus a,'),(10,'eu nibh vulputate mauris sagittis');

CREATE TABLE exams_pools
(
	exam_id BIGINT NOT NULL,
	pool_id BIGINT NOT NULL,
	tasks   SMALLINT NOT NULL,
	PRIMARY KEY (exam_id, pool_id),
	FOREIGN KEY (exam_id) REFERENCES exams (id),
	FOREIGN KEY (pool_id) REFERENCES pools (id)
)
;

-- Placeholder.
INSERT INTO exams_pools (exam_id,pool_id,tasks) VALUES (2,13,1),(10,7,1),(6,16,3),(9,32,2),(7,33,1),(10,24,2),(7,2,2),(8,15,2),(7,8,1),(9,8,3),(10,3,1),(4,12,2),(10,20,2),(5,2,1),(1,20,1),(1,31,3),(9,3,2),(8,4,1),(5,16,1),(8,6,3),(9,27,3),(8,28,3),(8,33,1),(4,24,3),(1,8,1),(2,7,1),(10,25,3),(7,31,3),(10,29,2),(1,14,1),(2,1,3),(3,8,2),(6,9,2),(6,5,3),(5,13,2),(5,20,1),(5,11,1),(7,3,1),(9,12,2),(5,4,3),(4,1,3),(9,9,2),(3,7,3),(4,19,1),(4,25,3),(7,15,3),(10,17,1),(2,18,1),(10,22,2),(4,22,3),(2,11,2),(4,28,2),(8,13,2),(5,21,1),(6,23,2),(2,27,3),(5,25,3),(9,20,3),(7,25,3),(7,29,3),(9,2,2),(6,19,2),(4,27,1),(1,9,1),(6,12,3),(8,27,2),(7,26,3),(2,5,2),(9,31,3),(10,30,3),(3,9,2),(6,3,1),(3,2,2),(8,17,2),(10,27,3),(6,17,3),(9,28,3),(3,15,3),(8,23,3),(5,29,1),(6,14,2),(2,25,3),(6,31,2),(8,9,3),(1,18,3),(6,13,3),(8,16,1);

CREATE TABLE assessments 
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	student_id BIGINT NOT NULL, 
	exam_id BIGINT NOT NULL,
	FOREIGN KEY (student_id) REFERENCES accounts (id),
	FOREIGN KEY (exam_id) REFERENCES exams (id)
)
;

CREATE TABLE assessments_tasks
(
	assessment_id BIGINT NOT NULL,
	task_id BIGINT NOT NULL,
	PRIMARY KEY (assessment_id, task_id),
	FOREIGN KEY (assessment_id) REFERENCES assessments (id),
	FOREIGN KEY (task_id) REFERENCES tasks (id)
)
;

CREATE TABLE answers 
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	assessment_id BIGINT NOT NULL,
	task_id BIGINT NOT NULL,
	input TEXT NOT NULL,
	FOREIGN KEY (assessment_id) REFERENCES assessments (id),
	FOREIGN KEY (task_id) REFERENCES tasks (id)
)
;

-- Views.

CREATE VIEW standard_accounts AS 
SELECT id, username, password
FROM accounts
;

CREATE VIEW standard_options AS 
SELECT id, task_id, description, reward 
FROM options 
;

CREATE VIEW standard_tasks AS 
SELECT tasks.id, task_types.class_name, description 
FROM tasks JOIN task_types ON tasks.type_id = task_types.id
;

CREATE VIEW standard_pools AS 
SELECT id, title 
FROM pools 
;

CREATE VIEW standard_pools_tasks AS 
SELECT pools_tasks.pool_id, standard_tasks.* 
FROM pools_tasks JOIN standard_tasks ON pools_tasks.task_id = standard_tasks.id 
;

CREATE VIEW shuffled_pools_tasks AS 
SELECT * 
FROM standard_pools_tasks
ORDER BY RANDOM( )
;

CREATE VIEW standard_exams AS 
SELECT id, title 
FROM exams 
;

CREATE VIEW standard_exams_pools AS 
SELECT exams_pools.exam_id, standard_pools.*, exams_pools.tasks
FROM exams_pools JOIN standard_pools ON exams_pools.pool_id = standard_pools.id 
;

CREATE VIEW standard_assessments AS 
SELECT id, exam_id, student_id
FROM assessments 
;

CREATE VIEW standard_assessments_tasks AS 
SELECT assessments_tasks.assessment_id, standard_tasks.*
FROM assessments_tasks JOIN standard_tasks ON assessments_tasks.task_id = standard_tasks.id
;

CREATE VIEW standard_answers AS 
SELECT id, assessment_id, task_id, input 
FROM answers 
;

-- Stored procedures.

CREATE FUNCTION account_create (arg_creator_id BIGINT, arg_username VARCHAR(100), arg_password TEXT)
RETURNS SETOF standard_accounts
AS
$$
BEGIN
	INSERT INTO accounts (id, username, password) 
	VALUES (DEFAULT, arg_username, arg_password)
	;
	IF FOUND THEN 
		RETURN QUERY SELECT * FROM standard_accounts WHERE id = currval('accounts_id_seq')
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL
;

CREATE FUNCTION pool_create (arg_creator_id BIGINT, arg_title VARCHAR(100))
RETURNS SETOF standard_pools 
AS 
$$
BEGIN
	INSERT INTO pools (id, title) 
	VALUES (DEFAULT, arg_title)
	;
	IF FOUND THEN 
		RETURN QUERY SELECT * FROM standard_pools WHERE id = currval('pools_id_seq')
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION pool_update (arg_pool_id BIGINT, arg_updator_id BIGINT, arg_title VARCHAR(100))
RETURNS BOOLEAN
AS 
$$
BEGIN
UPDATE pools 
SET title = arg_title 
WHERE id = arg_pool_id 
;
SELECT TRUE 
;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION exam_create (arg_creator_id BIGINT, arg_title VARCHAR(100))
RETURNS SETOF standard_exams 
AS 
$$
BEGIN
INSERT INTO exams (id, title) 
VALUES (DEFAULT, arg_title)
RETURNING (id, title)
;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION exam_update (arg_exam_id BIGINT, arg_updator_id BIGINT, arg_title VARCHAR(100))
RETURNS BOOLEAN
AS 
$$
BEGIN
UPDATE exams 
SEt title = arg_title 
WHERE id = arg_exam_id 
;
SELECT TRUE
;
END
;
$$
LANGUAGE PLpgSQL
STRICT
;

CREATE FUNCTION option_create (arg_creator_id BIGINT, arg_task_id BIGINT, arg_description TEXT, arg_reward SMALLINT)
RETURNS SETOF standard_options 
AS 
$$
BEGIN
	INSERT INTO options (id, task_id, description, reward) 
	VALUES (DEFAULT, arg_task_id, arg_description, arg_reward)
	;
	IF FOUND THEN
		RETURN QUERY SELECT * FROM standard_options WHERE id = currval('options_id_seq'); 
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION task_create (arg_creator_id BIGINT, arg_class_name VARCHAR(100), arg_description TEXT)
RETURNS SETOF standard_tasks 
AS 
$$
DECLARE
	var_type_id SMALLINT;
BEGIN
	SELECT id INTO var_type_id 
	FROM task_types 
	WHERE class_name = arg_class_name 
	;
	IF NOT FOUND THEN 
		INSERT INTO task_types (id, class_name) 
		VALUES (DEFAULT, arg_class_name)
		;
		SELECT currval('task_types_id_seq') INTO var_type_id
		;
	END IF
	;
	INSERT INTO tasks (id, type_id, description) 
	VALUES (DEFAULT, var_type_id, arg_description)
	;
	IF FOUND THEN
		-- Placeholder. 
		INSERT INTO pools_tasks (pool_id, task_id)
		VALUES (1, currval('tasks_id_seq'))
		;
		RETURN QUERY SELECT * FROM standard_tasks WHERE id = currval('tasks_id_seq');
	END IF  
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION task_update (arg_task_id BIGINT, arg_description TEXT)
RETURNS BOOLEAN 
AS 
$$
BEGIN
	UPDATE tasks 
	SET description = arg_description 
	WHERE id = arg_task_id
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION option_update (arg_option_id BIGINT, arg_updator_id BIGINT, arg_description TEXT, arg_reward SMALLINT)
RETURNS BOOLEAN
AS 
$$
BEGIN
	UPDATE options 
	SET description = arg_description,
	 reward = arg_reward 
	WHERE options.id = arg_option_id 
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION option_update_description (arg_option_id BIGINT, arg_updator_id BIGINT, arg_description TEXT)
RETURNS BOOLEAN
AS 
$$
BEGIN
	UPDATE options 
	SET description = arg_description
	WHERE options.id = arg_option_id 
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION option_update_reward (arg_option_id BIGINT, arg_updator_id BIGINT, arg_reward SMALLINT)
RETURNS BOOLEAN
AS 
$$
BEGIN
	UPDATE options 
	SET reward = arg_reward
	WHERE options.id = arg_option_id 
	;
	IF FOUND THEN
		SELECT TRUE
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgSQL 
STRICT 
;

CREATE FUNCTION assessment_create (arg_exam_id BIGINT, arg_student_id BIGINT)
RETURNS SETOF standard_assessments 
AS 
$$
DECLARE
	var_pool RECORD;
	var_assessment_id BIGINT;
BEGIN
	INSERT INTO assessments (id, exam_id, student_id)
	VALUES (DEFAULT, arg_exam_id, arg_student_id)
	;
	IF FOUND THEN
		SELECT currval('assessments_id_seq') INTO var_assessment_id
		;
		FOR var_pool IN SELECT * FROM standard_exams_pools WHERE exam_id = arg_exam_id LOOP
			EXECUTE 
				'INSERT INTO assessments_tasks (assessment_id, task_id) 
				SELECT ' || var_assessment_id || ', shuffled_pools_tasks.id 
				FROM shuffled_pools_tasks 
				WHERE shuffled_pools_tasks.pool_id = ' || var_pool.id ||
				' LIMIT ' || var_pool.tasks
			;
		END LOOP
		;
		RETURN QUERY SELECT * FROM standard_assessments WHERE id = currval('assessments_id_seq')
		;
	END IF 
	;
END
;
$$
LANGUAGE PLpgsQL 
STRICT 
;

CREATE FUNCTION answer_create (arg_assessment_id BIGINT, arg_task_id BIGINT, arg_input TEXT)
RETURNS SETOF standard_answers 
AS 
$$
BEGIN
	INSERT INTO answers (id, assessment_id, task_id, input)
	VALUES (DEFAULT, arg_assessment_id, arg_task_id, arg_input)
	;
	IF FOUND THEN
		RETURN QUERY SELECT * FROM standard_answers WHERE id = currval('answers_id_seq'); 
	END IF 
	;
END 
;
$$
LANGUAGE PLpgSQL 
STRICT 
;