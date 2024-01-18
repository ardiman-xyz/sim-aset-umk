import { Button } from "@/Components/ui/button";
import {
    Card,
    CardContent,
    CardFooter,
    CardHeader,
    CardTitle,
} from "@/Components/ui/card";
import { Progress } from "@/Components/ui/progress";
import { router } from "@inertiajs/react";

const DistributionItems = () => {
    return (
        <Card className="shadow-none border-none">
            <CardHeader>
                <h1 className="text-lg text-zinc-600 ">Sebaran Aset</h1>
            </CardHeader>
            <CardContent className="flex flex-col gap-y-2">
                <div className="flex items-center gap-x-3">
                    <h1 className="text-sm w-[100px]">Gedung A</h1>
                    <Progress value={33} />
                </div>
                <div className="flex items-center gap-x-3">
                    <h1 className="text-sm w-[100px]">Gedung B</h1>
                    <Progress value={20} />
                </div>
                <div className="flex items-center gap-x-3">
                    <h1 className="text-sm w-[100px]">Gedung C</h1>
                    <Progress value={50} />
                </div>
                <div className="flex items-center gap-x-3">
                    <h1 className="text-sm w-[100px]">Gedung D</h1>
                    <Progress value={80} />
                </div>

                <Button
                    variant={"secondary"}
                    className="w-full mt-10"
                    onClick={() => router.get(route("report.index"))}
                >
                    Lihat detail
                </Button>
            </CardContent>
        </Card>
    );
};

export default DistributionItems;
