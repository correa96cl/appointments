-- CreateTable
CREATE TABLE "users" (
    "idUser" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "nick" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "dateCreated" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Active',
    "cellPhone" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("idUser")
);

-- CreateTable
CREATE TABLE "countries" (
    "countryId" TEXT NOT NULL,
    "codeAlpha2" TEXT NOT NULL,
    "codePhone" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Active',
    "countryIdUser" TEXT NOT NULL,

    CONSTRAINT "countries_pkey" PRIMARY KEY ("countryId")
);

-- CreateTable
CREATE TABLE "appointments" (
    "idAppoinment" TEXT NOT NULL,
    "dateStartAppointment" TEXT NOT NULL,
    "dataEndAppointment" TEXT NOT NULL,
    "hourStartAppointment" TEXT NOT NULL,
    "hourEndAppointment" TEXT NOT NULL,
    "dateCreatedAppointment" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdatedAppointment" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "descriptionAppointment" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Active',
    "idAppointmentUser" TEXT,

    CONSTRAINT "appointments_pkey" PRIMARY KEY ("idAppoinment")
);

-- CreateTable
CREATE TABLE "addresses" (
    "idAddress" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" TEXT NOT NULL,
    "addressType" TEXT NOT NULL,
    "postalCode" INTEGER NOT NULL,
    "dateCreatedAddress" TIMESTAMP(3) NOT NULL,
    "dateUpdatedAddress" TIMESTAMP(3) NOT NULL,
    "state" TEXT NOT NULL DEFAULT 'Active',
    "idAddressUser" TEXT,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("idAddress")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "countries_countryIdUser_key" ON "countries"("countryIdUser");

-- AddForeignKey
ALTER TABLE "countries" ADD CONSTRAINT "countries_countryIdUser_fkey" FOREIGN KEY ("countryIdUser") REFERENCES "users"("idUser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appointments" ADD CONSTRAINT "appointments_idAppointmentUser_fkey" FOREIGN KEY ("idAppointmentUser") REFERENCES "users"("idUser") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_idAddressUser_fkey" FOREIGN KEY ("idAddressUser") REFERENCES "users"("idUser") ON DELETE SET NULL ON UPDATE CASCADE;
