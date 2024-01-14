import { Hint } from "@/Components/HInt";
import { Button } from "@/Components/ui/button";
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/Components/ui/table";
import { ChevronRight, QrCode } from "lucide-react";
import CreateForm from "./placement/create-form";

const Placement = () => {
    return (
        <Card className="mb-10">
            <CardHeader>
                <div className="flex items-center justify-between">
                    <div>
                        <CardTitle>Penempatan</CardTitle>
                        <CardDescription className="mt-2">
                            List detail penempatan aset anda
                        </CardDescription>
                    </div>
                    <div>
                        <CreateForm />
                    </div>
                </div>
            </CardHeader>
            <CardContent>
                <Table className="border">
                    <TableHeader>
                        <TableRow>
                            <TableHead className="w-[80px]">No.</TableHead>
                            <TableHead>Tempat</TableHead>
                            <TableHead className="text-center">
                                Qrcode
                            </TableHead>
                            <TableHead>Aksi</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        <TableRow>
                            <TableCell className="font-medium">1</TableCell>
                            <TableCell>
                                <div className="flex flex-row gap-x-1 items-center">
                                    <p> Gedung E</p>
                                    <ChevronRight className="h-4 w-4" />
                                    <p>Lantai 1</p>
                                    <ChevronRight className="h-4 w-4" />
                                    <p>Ruangan E102</p>
                                </div>
                            </TableCell>
                            <TableCell className="flex items-center justify-center">
                                <Hint
                                    description="Klik untuk melihat qrcode"
                                    side="top"
                                    sideOffset={2}
                                >
                                    <Button variant="outline">
                                        <QrCode />
                                    </Button>
                                </Hint>
                            </TableCell>
                            <TableCell>Aksi</TableCell>
                        </TableRow>
                    </TableBody>
                </Table>
            </CardContent>
        </Card>
    );
};

export default Placement;
